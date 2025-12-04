// manifest: startProject

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_admin/core/providers/serverpod_client_provider.dart';
import 'package:t36_admin/features/auth/presentation/providers/auth_state_providers.dart';

import '../../domain/repositories/admin_repository.dart';
import '../../domain/repositories/i_admin_repository.dart';
import '../../domain/repositories/super_admin_repository.dart';

part 'admin_data_providers.g.dart';

/// Провайдер-переключатель.
/// В зависимости от ID пользователя, предоставляет либо [SuperAdminRepository],
/// либо [AdminRepository].
@Riverpod(keepAlive: true)
IAdminRepository adminRepository(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  final userInfo = ref.watch(authStateChangesProvider).value;

  // 1 - это ID суперадминистратора
  if (userInfo?.id == 1) {
    return SuperAdminRepository(client);
  } else {
    return AdminRepository(client);
  }
}
