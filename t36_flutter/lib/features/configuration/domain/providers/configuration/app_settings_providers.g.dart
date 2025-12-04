// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Следит за изменением темы приложения.
/// Возвращает 'system', 'light' или 'dark'.

@ProviderFor(themeMode)
const themeModeProvider = ThemeModeProvider._();

/// Следит за изменением темы приложения.
/// Возвращает 'system', 'light' или 'dark'.

final class ThemeModeProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  /// Следит за изменением темы приложения.
  /// Возвращает 'system', 'light' или 'dark'.
  const ThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeHash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return themeMode(ref);
  }
}

String _$themeModeHash() => r'ae1b2df91122c6b1d5f3b0acf353dcabe72a6245';

/// Следит за настройкой анимаций.

@ProviderFor(enableAnimations)
const enableAnimationsProvider = EnableAnimationsProvider._();

/// Следит за настройкой анимаций.

final class EnableAnimationsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Следит за настройкой анимаций.
  const EnableAnimationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableAnimationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableAnimationsHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return enableAnimations(ref);
  }
}

String _$enableAnimationsHash() => r'efda6df96acefb896c339d68c7e79c92d704ad59';

/// Следит за настройкой количества элементов на странице.

@ProviderFor(itemsPerPage)
const itemsPerPageProvider = ItemsPerPageProvider._();

/// Следит за настройкой количества элементов на странице.

final class ItemsPerPageProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  /// Следит за настройкой количества элементов на странице.
  const ItemsPerPageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsPerPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsPerPageHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return itemsPerPage(ref);
  }
}

String _$itemsPerPageHash() => r'dbff93a90fbdf5a772889abb5a02c42bf8c5a36d';

/// Следит за настройкой громкости эффектов.

@ProviderFor(effectVolume)
const effectVolumeProvider = EffectVolumeProvider._();

/// Следит за настройкой громкости эффектов.

final class EffectVolumeProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  /// Следит за настройкой громкости эффектов.
  const EffectVolumeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'effectVolumeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$effectVolumeHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return effectVolume(ref);
  }
}

String _$effectVolumeHash() => r'4f802a0c81c367a089180fe7f207bdd74d187a0b';
