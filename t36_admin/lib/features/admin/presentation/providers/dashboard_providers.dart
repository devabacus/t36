// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_client/t36_client.dart';

import '../../data/providers/admin_data_providers.dart';

part 'dashboard_providers.g.dart';

@riverpod
Future<SuperAdminDashboard> dashboard(ref) async {
   return ref.watch(adminRepositoryProvider).getDashboardData();

}