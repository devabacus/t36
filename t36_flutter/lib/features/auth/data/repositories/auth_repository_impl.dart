// manifest: startProject
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/remote/i_auth_remote_data_source.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Stream<UserInfo?> watchCurrentUser() => _remoteDataSource.userStream;
  
  @override
  UserInfo? get currentUser => _remoteDataSource.currentUser;

  @override
  bool get isSignedIn => _remoteDataSource.isSignedIn;

  @override
  Future<void> signOut() => _remoteDataSource.signOut();
}