// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import '../../domain/providers/auth_usecase_providers.dart';

part 'auth_state_providers.g.dart';

@riverpod
Stream<UserInfo?> authStateChanges(Ref ref) {
  final watchUserUseCase = ref.watch(watchUserUseCaseProvider);
  return watchUserUseCase();
}