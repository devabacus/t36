// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:t36_server/src/birthday_reminder.dart';
import 'package:t36_server/src/web/routes/root.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/util/server_init.dart';


enum FutureCallNames {
  birthdayReminder,
}

void run(List<String> args) async {
  // --- ПРОВЕРЯЕМ РЕЖИМ ПЕРЕД ИНИЦИАЛИЗАЦИЕЙ ---
  // Ищем флаг --role и его значение 'maintenance' напрямую в аргументах
  // это нужно для deployment в kubernaties
  var isMaintenance = false;
  try {
    final roleIndex = args.indexOf('--role');
    if (roleIndex != -1 && args.length > roleIndex + 1) {
      if (args[roleIndex + 1] == 'maintenance') {
        isMaintenance = true;
      }
    }
  } catch (e) {
    // Игнорируем любые ошибки парсинга на этом этапе
  }


  // ------------------------------------------

  // ВАЖНО: Устанавливаем AuthConfig ДО любых операций с auth
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      print('Код подтверждения для $email: $validationCode');
      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print('Код сброса пароля для ${userInfo.email}: $validationCode');
      return true;
    },
  ));

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  if (!isMaintenance) {
    // Setup a default page at the web root.
    pod.webServer.addRoute(RootRoute(), '/');
    pod.webServer.addRoute(RootRoute(), '/index.html');
    // Serve all files in the /static directory.
    // pod.webServer.addRoute(
    //   StaticRoute.directory(Directory('static')),
    //   '/*',
    // );
  }

  // Start the server.
  await pod.start();

  // Инициализация БД ПОСЛЕ запуска сервера и установки AuthConfig
  print('=== STARTING DATABASE INITIALIZATION ===');

  try {
    // Создаем временную сессию для выполнения операций с БД.
    final session = await pod.createSession(enableLogging: true);

    print('Session created, starting ServerInit.run()...');

    // Запускаем наш скрипт инициализации.
    await ServerInit.run(session);

    print('ServerInit.run() completed');

    // Закрываем сессию.
    await session.close();

    print('=== DATABASE INITIALIZATION COMPLETED ===');
  } catch(e, st) {
    print('=== DATABASE INITIALIZATION FAILED ===');
    print('Error: $e');
    print('Stack trace: $st');

    // Логируем любую ошибку, которая могла произойти во время инициализации.
    pod.logVerbose(
      'Failed to seed initial data: $e \n$st',
    );
  }

  // Настраиваем future calls, если они есть
  pod.registerFutureCall(
    BirthdayReminder(),
    FutureCallNames.birthdayReminder.name,
  );

  await pod.futureCallWithDelay(
    FutureCallNames.birthdayReminder.name,
    Greeting(
      message: 'Hello!',
      author: 'Serverpod Server',
      timestamp: DateTime.now(),
    ),
    Duration(seconds: 5),
  );
}