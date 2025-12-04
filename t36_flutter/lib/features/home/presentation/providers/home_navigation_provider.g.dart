// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeNavigationService)
const homeNavigationServiceProvider = HomeNavigationServiceProvider._();

final class HomeNavigationServiceProvider
    extends
        $FunctionalProvider<
          HomeNavigationService,
          HomeNavigationService,
          HomeNavigationService
        >
    with $Provider<HomeNavigationService> {
  const HomeNavigationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeNavigationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeNavigationServiceHash();

  @$internal
  @override
  $ProviderElement<HomeNavigationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HomeNavigationService create(Ref ref) {
    return homeNavigationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeNavigationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeNavigationService>(value),
    );
  }
}

String _$homeNavigationServiceHash() =>
    r'f03c14873caf1ce8f4f324ef853a3117d17c2276';
