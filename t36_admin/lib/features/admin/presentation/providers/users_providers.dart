// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_client/t36_client.dart';

import '../../data/providers/admin_data_providers.dart';

part 'users_providers.g.dart';

@riverpod
Future<List<UserDetails>> usersList(Ref ref) async {
  return ref.watch(adminRepositoryProvider).getUsers();
}

@riverpod
Future<List<Customer>> customersList(Ref ref) async {
  // Используем метод из репозитория пользователей
  return ref.watch(adminRepositoryProvider).getCustomers();
}

@riverpod
Future<void> createUser(
  Ref ref, {
  required String userName,
  required String email,
  required String password,
  required String customerId,
  required String roleId,
}) async {
  final link = ref.keepAlive();
  try {
    await ref
        .read(adminRepositoryProvider)
        .createUser(
          userName: userName,
          email: email,
          password: password,
          customerId: customerId,
          roleId: roleId,
        );
    ref.invalidate(usersListProvider);
  } finally {
    link.close();
  }
}

@riverpod
Future<SuperUserDetails?> userDetails(Ref ref, int userId) async {
  return ref.watch(adminRepositoryProvider).getUserDetails(userId);
}

@riverpod
Future<void> updateUser(
  Ref ref, {
  required int userId,
  required String userName,
  required String email,
  required String customerId,
  required String roleId,
}) async {
  final link = ref.keepAlive();
  try {
    await ref
        .read(adminRepositoryProvider)
        .updateUser(
          userId: userId,
          userName: userName,
          email: email,
          customerId: customerId,
          roleId: roleId,
        );
    ref.invalidate(usersListProvider);
    ref.invalidate(userDetailsProvider(userId));
  } finally {
    link.close();
  }
}

@riverpod
Future<void> deleteUser(Ref ref, int userId) async {
  final link = ref.keepAlive();
  try {
    await ref.read(adminRepositoryProvider).deleteUser(userId);
    ref.invalidate(usersListProvider);
  } finally {
    link.close();
  }
}

@riverpod
Future<void> blockUser(Ref ref, int userId, bool blocked) async {
  final link = ref.keepAlive();
  try {
    await ref.read(adminRepositoryProvider).blockUser(userId, blocked);
    ref.invalidate(usersListProvider);
    ref.invalidate(userDetailsProvider(userId));
  } finally {
    link.close();
  }
}
