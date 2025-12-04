// manifest: startProject
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

abstract class IAuthRemoteDataSource {
  Stream<UserInfo?> get userStream;
  UserInfo? get currentUser;
  Future<void> signOut();
  bool get isSignedIn;
}