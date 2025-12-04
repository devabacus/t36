// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../daos/sync_metadata_dao.dart';
import '../datasources/sync_metadata_local_data_source.dart';
import '../interfaces/sync_metadata_local_datasource_service.dart';
import 'database_provider.dart';

part 'sync_metadata_providers.g.dart';

@riverpod
SyncMetadataDao syncMetadataDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return SyncMetadataDao(databaseService.database);
}

@riverpod
ISyncMetadataLocalDataSource syncMetadataLocalDataSource(Ref ref) {
  final syncMetadataDao = ref.read(syncMetadataDaoProvider);
  return SyncMetadataLocalDataSource(syncMetadataDao);
}

