// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import '../../../../../core/permissions.dart';
import '../../../../../core/services/permission/permission_service.dart';
import 'package:t36_client/t36_client.dart';

import '../../providers/dashboard_providers.dart';
import '../../routings/organizations_routes_constants.dart';
import '../../routings/roles_routes_constants.dart';
import '../../routings/user_routes_constants.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);
    
    return dashboardState.when(
      data: (dashboard) => RefreshIndicator(
        onRefresh: () => ref.refresh(dashboardProvider.future),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Верхние карточки со статистикой
            _StatsGrid(dashboard: dashboard),
            const SizedBox(height: 24),
            // Секция с быстрыми действиями
            QuickActions(),
            const SizedBox(height: 24),
            // Список последних пользователей
            _RecentUsersList(users: dashboard.recentUsers),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Ошибка загрузки: $e')),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final SuperAdminDashboard dashboard;
  const _StatsGrid({required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _StatCard(
          icon: Icons.people,
          label: 'Всего пользователей',
          value: dashboard.totalUsers.toString(),
          color: Colors.blue,
        ),
        _StatCard(
          icon: Icons.business,
          label: 'Всего организаций',
          value: dashboard.totalCustomers.toString(),
          color: Colors.orange,
        ),
        _StatCard(
          icon: Icons.person_add_disabled,
          label: 'Заблокировано',
          value: dashboard.blockedUsers.toString(),
          color: Colors.red,
        ),
        _StatCard(
          icon: Icons.check_circle,
          label: 'Активные пользователи',
          value: dashboard.activeUsers.toString(),
          color: Colors.green,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Быстрые действия', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              if (ref.hasPermission(Permissions.usersRead))
              _actionButton(context, 'Пользователи', Icons.people_outline, UsersRoutes.users),
            if (ref.hasPermission(Permissions.rolesRead))
              _actionButton(context, 'Роли', Icons.security_outlined, RolesRoutes.roles),
            if (ref.hasPermission(Permissions.organizationsRead))
              _actionButton(context, 'Организации', Icons.business_outlined, OrganizationsRoutes.organizations),
          ],
        ),
      ],
    );
  }

  Widget _actionButton(BuildContext context, String label, IconData icon, String path) {
    return GestureDetector(
      onTap: () => context.pushNamed(path),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}


class _RecentUsersList extends StatelessWidget {
  final List<UserInfo> users;
  const _RecentUsersList({required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Новые пользователи', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          child: users.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text('Нет недавних пользователей.')),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(user.userName![0].toUpperCase())),
                      title: Text(user.userName!),
                      subtitle: Text(user.email!),
                      trailing: Text(
                        '${user.created.day}.${user.created.month}.${user.created.year}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      onTap: () {
                         context.push(UsersRoutes.editUserPathWithId(user.id.toString()));
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class LimitedDashboardView extends StatelessWidget {
  const LimitedDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Можно добавить приветствие или другую информацию
          const Text(
            'Доступные разделы',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Используем виджет с быстрыми действиями, который проверяет права
          QuickActions(),
        ],
      ),
    );
  }
}

