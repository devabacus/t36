// manifest: startProject
// ignore_for_file: unused_import
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36/features/configuration/presentation/routing/configuration_router_config.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/auth/presentation/routing/auth_router_config.dart';
import '../../features/bluetooth/presentation/routing/bluetooth_router_config.dart';
import '../../features/configuration/presentation/routing/configuration_routes_constants.dart';
import '../../features/home/presentation/routing/home_router_config.dart';
import '../../features/home/presentation/routing/home_routes_constants.dart';
import './routes_constants.dart';

part 'router_config.g.dart';
 
@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    // observers: [TalkerRouteObserver(log.talker)],
    // initialLocation: HomeRoutes.homePath,
    routes: [
      ...getAuthRoutes(),
			...getHomeRoutes(),
      ...getConfigurationRoutes(),
      ...getBluetoothRoutes(),                
    ]); 
}   

