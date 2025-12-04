// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Categories)
const categoriesProvider = CategoriesProvider._();

final class CategoriesProvider
    extends $AsyncNotifierProvider<Categories, List<CategoryEntity>> {
  const CategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  Categories create() => Categories();
}

String _$categoriesHash() => r'f39a90786254550dcd17b7a204c4846524db7e08';

abstract class _$Categories extends $AsyncNotifier<List<CategoryEntity>> {
  FutureOr<List<CategoryEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CategoryEntity>>, List<CategoryEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CategoryEntity>>,
                List<CategoryEntity>
              >,
              AsyncValue<List<CategoryEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(categoriesStream)
const categoriesStreamProvider = CategoriesStreamProvider._();

final class CategoriesStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CategoryEntity>>,
          List<CategoryEntity>,
          Stream<List<CategoryEntity>>
        >
    with
        $FutureModifier<List<CategoryEntity>>,
        $StreamProvider<List<CategoryEntity>> {
  const CategoriesStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<CategoryEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CategoryEntity>> create(Ref ref) {
    return categoriesStream(ref);
  }
}

String _$categoriesStreamHash() => r'478d6130884f22933e7ad88921c84f7f5ca555b2';
