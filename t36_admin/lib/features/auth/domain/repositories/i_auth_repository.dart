// manifest: startProject
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

abstract class IAuthRepository {
  Stream<UserInfo?> watchCurrentUser();
  Future<void> signOut();
  UserInfo? get currentUser;
  bool get isSignedIn;
}