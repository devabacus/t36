// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboard)
const dashboardProvider = DashboardProvider._();

final class DashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<SuperAdminDashboard>,
          SuperAdminDashboard,
          FutureOr<SuperAdminDashboard>
        >
    with
        $FutureModifier<SuperAdminDashboard>,
        $FutureProvider<SuperAdminDashboard> {
  const DashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardHash();

  @$internal
  @override
  $FutureProviderElement<SuperAdminDashboard> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SuperAdminDashboard> create(Ref ref) {
    return dashboard(ref);
  }
}

String _$dashboardHash() => r'c5e4e72b4a7b0a59297519083eb97c0dd59986e0';
