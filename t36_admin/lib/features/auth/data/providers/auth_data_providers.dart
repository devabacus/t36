// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../datasources/remote/i_auth_remote_data_source.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_data_providers.g.dart';

@Riverpod(keepAlive: true)
IAuthRemoteDataSource authRemoteDataSource(ref) {
  final sessionManager = ref.watch(sessionManagerProvider);
  final dataSource = AuthRemoteDataSource(sessionManager);
  ref.onDispose(() => dataSource.dispose());
  return dataSource;
}

@Riverpod(keepAlive: true)
IAuthRepository authRepository(ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}