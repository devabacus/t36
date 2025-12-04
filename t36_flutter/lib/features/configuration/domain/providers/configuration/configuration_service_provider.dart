// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../auth/presentation/providers/auth_state_providers.dart';
import '../../../data/providers/configuration/configuration_data_providers.dart';
import '../../../data/services/configuration_service_impl.dart';
import '../../../presentation/registry/settings_registry.dart';
import '../../services/i_configuration_service.dart';

part 'configuration_service_provider.g.dart';

/// Провайдер, предоставляющий экземпляр сервиса конфигурации [IConfigurationService].
///
/// Он следит за текущим пользователем и автоматически предоставляет сервис,
/// настроенный для этого пользователя. Выбрасывает исключение, если
/// пользователь не аутентифицирован, так как работа с настройками без
/// пользователя не имеет смысла.
@riverpod
IConfigurationService configurationService(Ref ref) {
    final currentUser = ref.watch(authStateChangesProvider).value;

  final customerId = ref.watch(currentCustomerIdProvider);
  
  if (currentUser?.id == null || customerId == null) {
    // В реальном приложении здесь лучше возвращать Mock-сервис или
    // обрабатывать это состояние на уровне UI, чтобы не вызывать ошибку.
    throw StateError('ConfigurationService requires an authenticated user.');
  }

  final repository = ref.watch(configurationRepositoryProvider(
    userId: currentUser!.id!,
    customerId: customerId,
  ));

  final registry = ref.watch(settingsRegistryProvider);

  return ConfigurationServiceImpl(
    repository: repository,
    registry: registry,
  );
}