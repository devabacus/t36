// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:t36_server/src/generated/protocol.dart';
import 'shared/auth_context_mixin.dart';
import 'user_manager_endpoint.dart';

const _configurationChannelBase = 't36_configuration_events_for_user_';

class ConfigurationEndpoint extends Endpoint with AuthContextMixin {
  
  Future<void> _notifyChange(Session session, ConfigurationSyncEvent event, AuthenticatedUserContext authContext) async { 
    final channel = '$_configurationChannelBase${authContext.userId}-${authContext.customerId.uuid}'; 
    await session.messages.postMessage(channel, event);
    session.log('🔔 Событие ${event.type.name} отправлено в канал "$channel"');
  }

  Future<Configuration> createConfiguration(Session session, Configuration configuration) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final existingConfiguration = await Configuration.db.findFirstRow(
      session,
      where: (c) => c.id.equals(configuration.id) & c.userId.equals(userId) & c.customerId.equals(customerId),
    );

    final serverConfiguration = configuration.copyWith(
        userId: userId,
        customerId: customerId,
        lastModified: DateTime.now().toUtc(),
        isDeleted: false,
    );

    if (existingConfiguration != null) {
      session.log('ℹ️ "createConfiguration" вызван для существующего ID. Выполняется обновление (воскрешение).');
      final updatedConfiguration = await Configuration.db.updateRow(session, serverConfiguration);

      await _notifyChange(session, ConfigurationSyncEvent(
          type: SyncEventType.update, 
          configuration: updatedConfiguration,
      ), authContext); 
      return updatedConfiguration;

    } else {
      final createdConfiguration = await Configuration.db.insertRow(session, serverConfiguration);
      await _notifyChange(session, ConfigurationSyncEvent(
          type: SyncEventType.create,
          configuration: createdConfiguration,
      ), authContext); 
      return createdConfiguration;
    }
  }

  Future<List<Configuration>> getConfigurations(Session session, {int? limit}) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    return await Configuration.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
      limit: limit
    );
  }     

  Future<Configuration?> getConfigurationById(Session session, UuidValue id) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;
    
    return await Configuration.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
    );
  }

  Future<List<Configuration>> getConfigurationsSince(Session session, DateTime? since) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    if (since == null) {
      return getConfigurations(session);
    }
    return await Configuration.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.customerId.equals(customerId) & (c.lastModified >= since),
      orderBy: (c) => c.lastModified,
    );
  }

  Future<bool> updateConfiguration(Session session, Configuration configuration) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final originalConfiguration = await Configuration.db.findFirstRow(
      session,
      where: (c) => c.id.equals(configuration.id) & c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
    );
    if (originalConfiguration == null) {
      return false; 
    }
    final serverConfiguration = configuration.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    try {
      await Configuration.db.updateRow(session, serverConfiguration);
      await _notifyChange(session, ConfigurationSyncEvent(
        type: SyncEventType.update,
        configuration: serverConfiguration,
      ), authContext);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  Stream<ConfigurationSyncEvent> watchEvents(Session session) async* {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final channel = '$_configurationChannelBase$userId-${customerId.uuid}'; 
    session.log('🟢 Клиент (user: $userId, customer: ${customerId.uuid}) подписался на события в канале "$channel"');
    try {
      await for (var event in session.messages.createStream<ConfigurationSyncEvent>(channel)) {
        session.log('🔄 Пересылаем событие ${event.type.name} клиенту (user: $userId, customer: ${customerId.uuid})');
        yield event;
      }
    } finally {
      session.log('🔴 Клиент (user: $userId, customer: ${customerId.uuid}) отписался от канала "$channel"');
    }
  }   
    
}          