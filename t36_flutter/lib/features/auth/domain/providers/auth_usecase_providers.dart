// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/auth_data_providers.dart';
import '../usecases/auth_usecases.dart';

part 'auth_usecase_providers.g.dart';

@riverpod
WatchUserUseCase watchUserUseCase(ref) {
  final repository = ref.watch(authRepositoryProvider);
  return WatchUserUseCase(repository);
}

@riverpod
SignOutUseCase signOutUseCase(ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}

@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(ref) {
    final repository = ref.watch(authRepositoryProvider);
    return GetCurrentUserUseCase(repository);
}

@riverpod
IsSignedInUseCase isSignedInUseCase(ref) {
    final repository = ref.watch(authRepositoryProvider);
    return IsSignedInUseCase(repository);
}