// manifest: entity
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../auth/presentation/providers/auth_state_providers.dart';
import '../../../domain/entities/tag/tag_entity.dart';
import '../../../domain/providers/tag/tag_usecase_providers.dart';
import '../tag/tag_state_providers.dart';

part 'tag_get_by_id_provider.g.dart';

@riverpod
Future<TagEntity?> getTagById(Ref ref, String id) async {
  // Получаем userId и customerId из текущей сессии
  final currentUser = ref.watch(authStateChangesProvider).value;

  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  // Если пользователь не авторизован или customerId не доступен, возвращаем null
  if (currentUser?.id == null || currentCustomerId == null) {
    return null;
  }

  // Приводим userId и customerId к строковому виду, если они UuidValue
  currentUser!.id!.toString();
  final String customerId = currentCustomerId.toString();

  final tagsAsyncValue = ref.watch(tagsStreamProvider);

  if (tagsAsyncValue.hasValue) {
    final tag = tagsAsyncValue.value?.firstWhere(
      (t) => t.id == id,
      // Временный объект для orElse должен соответствовать новой структуре TagEntity
      orElse: () => TagEntity(
        id: 'NOT_FOUND',
        title: '',
        lastModified: DateTime.now().toUtc(), // lastModified теперь не nullable
        userId: currentUser.id!, // Используем фактический userId
        customerId: customerId, // Используем фактический customerId
        createdAt: DateTime.now().toUtc(), // createdAt теперь не nullable
        isDeleted: false, // isDeleted тоже не nullable
      ),
    );
    // Если нашли реальный объект, возвращаем его
    if (tag != null && tag.id != 'NOT_FOUND') {
      return tag;
    }
  }

  // Если в кеше нет или кеш еще не загружен, делаем прямой запрос к базе через UseCase
  final getTagByIdUseCase = ref.read(getTagByIdUseCaseProvider);

  // Проверяем, что use case доступен
  if (getTagByIdUseCase == null) {
    return null;
  }

  final tagFromDb = await getTagByIdUseCase(id);
  return tagFromDb;
}
