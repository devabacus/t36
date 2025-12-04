// manifest: startProject
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import '../repositories/i_auth_repository.dart';

class WatchUserUseCase {
  final IAuthRepository _repository;
  WatchUserUseCase(this._repository);

  Stream<UserInfo?> call() {
    return _repository.watchCurrentUser();
  }
}

class SignOutUseCase {
  final IAuthRepository _repository;
  SignOutUseCase(this._repository);

  Future<void> call() {
    return _repository.signOut();
  }
}

class GetCurrentUserUseCase {
  final IAuthRepository _repository;
  GetCurrentUserUseCase(this._repository);

  UserInfo? call() {
    return _repository.currentUser;
  }
}

class IsSignedInUseCase {
    final IAuthRepository _repository;
    IsSignedInUseCase(this._repository);

    bool call() {
        return _repository.isSignedIn;
    }
}