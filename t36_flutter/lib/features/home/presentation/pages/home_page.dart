// manifest: startProject

import 'package:ble_feature/ble_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../../../../core/providers/serverpod_client_provider.dart';
import '../../../auth/domain/providers/auth_usecase_providers.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';
import '../../../bluetooth/presentation/routing/bluetooth_routes_constants.dart';
import '../../../configuration/presentation/routing/configuration_routes_constants.dart';
import '../widgets/creation_section.dart';
import '../widgets/data_display_section.dart';
import '../widgets/relation_management_section.dart';
import '../widgets/settings_display_section.dart';
import '../widgets/simple_file_upload.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _selectedCategoryId;
  String? _selectedTaskId;
  String? _selectedTagId;

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authStateChangesProvider).value;
    final bluetoothState = ref.watch(bluetoothControllerProvider);
    final isConnected = bluetoothState.connectedDevice != null;
    final client = ref.watch(serverpodClientProvider);

    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('T2 Demo')),
        body: const Center(child: Text('Пожалуйста, войдите в систему')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('T2 Demo Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bluetooth,
              color: isConnected ? Colors.green : null,
            ),
            tooltip: 'Bluetooth',
            onPressed: () {
              context.push(BluetoothRoutes.bluetoothPath);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Настройки',
            onPressed: () {
              context.push(ConfigurationRoutes.configurationPath);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выход',
            onPressed: () async {
              await ref.read(signOutUseCaseProvider)();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Добавляем виджет загрузки файлов
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Тест загрузки файлов',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SimpleFileUpload(client: client),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Остальные виджеты
            const SettingsDisplaySection(),
            if (isConnected) 
              const CharacteristicControlWidget()
            else 
              const SizedBox.shrink(),

            CreationSection(
              selectedCategoryId: _selectedCategoryId,
              onCategoryChanged: (value) =>
                  setState(() => _selectedCategoryId = value),
            ),
            const SizedBox(height: 20),
            RelationManagementSection(
              selectedTaskId: _selectedTaskId,
              selectedTagId: _selectedTagId,
              onTaskChanged: (value) => setState(() => _selectedTaskId = value),
              onTagChanged: (value) => setState(() => _selectedTagId = value),
            ),
            const SizedBox(height: 20),
            DataDisplaySection(
              selectedTaskId: _selectedTaskId,
              selectedTagId: _selectedTagId,
            ),
          ],
        ),
      ),
    );
  }
}