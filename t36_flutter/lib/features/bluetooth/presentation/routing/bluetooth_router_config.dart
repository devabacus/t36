// manifest: startProject
import 'package:go_router/go_router.dart';
import 'package:ble_feature/ble_feature.dart';
import 'bluetooth_routes_constants.dart';

List<RouteBase> getBluetoothRoutes() {
  return [
    GoRoute(
      name: BluetoothRoutes.bluetooth,
      path: BluetoothRoutes.bluetoothPath,
      builder: (context, state) => const BluetoothPage(),
    ),
  ];
}
