// manifest: startProject
import 'dart:async';

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'i_auth_remote_data_source.dart';

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final SessionManager _sessionManager;
  late final StreamController<UserInfo?> _userStreamController;

  AuthRemoteDataSource(this._sessionManager) {
    _userStreamController = StreamController<UserInfo?>.broadcast(
      onListen: _onListen,
      onCancel: _onCancel,
    );
  }

  void _onListen() {
    _sessionManager.addListener(_onUserChanged);
    _userStreamController.add(_sessionManager.signedInUser);
  }

  void _onCancel() {
    _sessionManager.removeListener(_onUserChanged);
  }

  void _onUserChanged() {
    _userStreamController.add(_sessionManager.signedInUser);
  }

  @override
  Stream<UserInfo?> get userStream => _userStreamController.stream;

  @override
  UserInfo? get currentUser => _sessionManager.signedInUser;

  @override
  bool get isSignedIn => currentUser != null;

  @override
  Future<void> signOut() {
    return _sessionManager.signOutDevice();
  }

  void dispose() {
    _userStreamController.close();
  }
}