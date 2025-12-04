// manifest: manyToMany
import 'package:serverpod/serverpod.dart';
import 'package:t36_server/src/generated/protocol.dart';
import 'shared/auth_context_mixin.dart';
import 'user_manager_endpoint.dart';

const _taskTagMapChannelBase = 't36_task_tag_map_events_for_user_';

class TaskTagMapEndpoint extends Endpoint with AuthContextMixin {
  Future<void> _notifyChange(Session session, TaskTagMapSyncEvent event,
      AuthenticatedUserContext authContext) async {
    final channel =
        '$_taskTagMapChannelBase${authContext.userId}-${authContext.customerId.uuid}';
    await session.messages.postMessage(channel, event);
    session.log(
        '🔔 Событие TaskTagMap ${event.type.name} отправлено в канал "$channel"');
  }

  Future<void> _validateTaskAndTag(Session session, TaskTagMap model) async {
    // Проверяем, что Task существует и принадлежит пользователю
    final task = await Task.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(model.taskId) &
          t.userId.equals(model.userId) &
          t.customerId.equals(model.customerId) &
          t.isDeleted.equals(false),
    );
    if (task == null) {
      throw Exception(
          'Task с ID ${model.taskId} не найден или не принадлежит пользователю');
    }

    // Проверяем, что Tag существует и принадлежит пользователю
    final tag = await Tag.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(model.tagId) &
          t.userId.equals(model.userId) &
          t.customerId.equals(model.customerId) &
          t.isDeleted.equals(false),
    );
    if (tag == null) {
      throw Exception(
          'Tag с ID ${model.tagId} не найден или не принадлежит пользователю');
    }
  }

  Future<TaskTagMap> createTaskTagMap(
      Session session, TaskTagMap taskTagMap) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final taskId = taskTagMap.taskId;
    final tagId = taskTagMap.tagId;

    // Валидация входных данных
    await _validateTaskAndTag(session, taskTagMap);

    return await session.db.transaction((transaction) async {
      // Ищем существующую связь (включая удаленные) внутри транзакции
      final existingRelation = await TaskTagMap.db.findFirstRow(
        session,
        where: (r) =>
            r.taskId.equals(taskId) &
            r.tagId.equals(tagId) &
            r.userId.equals(userId) &
            r.customerId.equals(customerId),
        transaction: transaction,
      );

      final now = DateTime.now().toUtc();
      TaskTagMap result;

      if (existingRelation != null) {
        if (!existingRelation.isDeleted) {
          // Связь уже существует и активна
          session.log('ℹ️ Связь Task($taskId) ↔ Tag($tagId) уже существует');
          return existingRelation;
        }

        // "Воскрешаем" удаленную связь
        session
            .log('ℹ️ Воскрешаем удаленную связь Task($taskId) ↔ Tag($tagId)');
        result = await TaskTagMap.db.updateRow(
          session,
          existingRelation.copyWith(isDeleted: false, lastModified: now),
          transaction: transaction,
        );

        await _notifyChange(
            session,
            TaskTagMapSyncEvent(
              type: SyncEventType.update,
              taskTagMap: result,
            ),
            authContext);
      } else {
        // Создаем новую связь
        result = await TaskTagMap.db.insertRow(
          session,
          TaskTagMap(
            taskId: taskId,
            tagId: tagId,
            userId: userId,
            customerId: taskTagMap.customerId,
            createdAt: taskTagMap.createdAt,
            lastModified: DateTime.now().toUtc(),
            isDeleted: false,
          ),
          transaction: transaction,
        );

        await _notifyChange(
            session,
            TaskTagMapSyncEvent(
              type: SyncEventType.create,
              taskTagMap: result,
            ),
            authContext);
      }

      session.log(
          '✅ Создана связь Task($taskId) ↔ Tag($tagId) для пользователя $userId');
      return result;
    });
  }

  Future<List<Tag>> getTagsForTask(Session session, UuidValue taskId) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    // Сначала проверяем, что задача существует и принадлежит пользователю
    final task = await Task.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(taskId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
    );

    if (task == null) {
      throw Exception(
          'Task с ID $taskId не найден или не принадлежит пользователю');
    }

    // Получаем ID тегов через связующую таблицу
    final taskTagMaps = await TaskTagMap.db.find(
      session,
      where: (ttm) =>
          ttm.taskId.equals(taskId) &
          ttm.userId.equals(userId) &
          ttm.customerId.equals(customerId) &
          ttm.isDeleted.equals(false),
    );

    if (taskTagMaps.isEmpty) {
      return [];
    }

    final tagIds = taskTagMaps.map((ttm) => ttm.tagId).toSet();

    // Получаем сами теги
    return await Tag.db.find(
      session,
      where: (t) =>
          t.id.inSet(tagIds) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
      orderBy: (t) => t.title,
    );
  }

  Future<List<Task>> getTasksForTag(Session session, UuidValue tagId) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    // Сначала проверяем, что тег существует и принадлежит пользователю
    final tag = await Tag.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(tagId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
    );

    if (tag == null) {
      throw Exception(
          'Tag с ID $tagId не найден или не принадлежит пользователю');
    }

    // Получаем ID задач через связующую таблицу
    final taskTagMaps = await TaskTagMap.db.find(
      session,
      where: (ttm) =>
          ttm.tagId.equals(tagId) &
          ttm.userId.equals(userId) &
          ttm.customerId.equals(customerId) &
          ttm.isDeleted.equals(false),
    );

    if (taskTagMaps.isEmpty) {
      return [];
    }

    final taskIds = taskTagMaps.map((ttm) => ttm.taskId).toSet();

    // Получаем сами задачи
    return await Task.db.find(
      session,
      where: (t) =>
          t.id.inSet(taskIds) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
      orderBy: (t) => t.title,
    );
  }

  Future<List<TaskTagMap>> getTaskTagMapsSince(
      Session session, DateTime? since) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    return await TaskTagMap.db.find(
      session,
      // Возвращаем все записи (включая удаленные), которые изменились после 'since'
      where: (r) =>
          r.userId.equals(userId) &
          r.customerId.equals(customerId) &
          (since == null ? Constant.bool(true) : r.lastModified >= since),
      orderBy: (r) => r.lastModified,
    );
  }

  Stream<TaskTagMapSyncEvent> watchEvents(Session session) async* {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    // final channel = '$_taskTagMapChannelBase$userId';
    final channel = '$_taskTagMapChannelBase$userId-${customerId.uuid}';
    session.log(
        '🟢 Клиент (user: $userId) подписался на события TaskTagMap в канале "$channel"');

    try {
      await for (var event
          in session.messages.createStream<TaskTagMapSyncEvent>(channel)) {
        session.log(
            '🔄 Пересылаем событие TaskTagMap ${event.type.name} клиенту (user: $userId)');
        yield event;
      }
    } finally {
      session.log(
          '🔴 Клиент (user: $userId) отписался от канала TaskTagMap "$channel"');
    }
  }

  Future<bool> deleteTaskTagMapByTaskAndTag(
      Session session, UuidValue taskId, UuidValue tagId) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    return await session.db.transaction((transaction) async {
      // Находим активную связь по бизнес-ключу
      final relation = await TaskTagMap.db.findFirstRow(
        session,
        where: (r) =>
            r.taskId.equals(taskId) &
            r.tagId.equals(tagId) &
            r.userId.equals(userId) &
            r.customerId.equals(customerId) &
            r.isDeleted.equals(false),
        transaction: transaction,
      );

      if (relation == null) {
        session.log(
            '⚠️ Попытка удалить несуществующую или уже удаленную связь: Task($taskId) <-> Tag($tagId)');
        return false; // Запись не найдена или уже удалена, считаем операцию успешной.
      }

      // "Мягкое" удаление найденной связи
      final tombstone = relation.copyWith(
        isDeleted: true,
        lastModified: DateTime.now().toUtc(),
      );

      final result = await TaskTagMap.db
          .updateRow(session, tombstone, transaction: transaction);

      // Уведомляем клиентов об удалении, используя серверный ID, который они знают (или получат)
      await _notifyChange(
          session,
          TaskTagMapSyncEvent(
            type: SyncEventType.update,
            id: result.id, // Отправляем ID удаленной записи
            taskTagMap: result,
          ),
          authContext);

      session.log(
          '✅ Удалена связь Task($taskId) <-> Tag($tagId) для пользователя $userId');
      return true;
    });
  }
}
