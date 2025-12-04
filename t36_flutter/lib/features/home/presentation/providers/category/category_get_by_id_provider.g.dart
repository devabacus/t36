// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_get_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCategoryById)
const getCategoryByIdProvider = GetCategoryByIdFamily._();

final class GetCategoryByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryEntity?>,
          CategoryEntity?,
          FutureOr<CategoryEntity?>
        >
    with $FutureModifier<CategoryEntity?>, $FutureProvider<CategoryEntity?> {
  const GetCategoryByIdProvider._({
    required GetCategoryByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getCategoryByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCategoryByIdHash();

  @override
  String toString() {
    return r'getCategoryByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CategoryEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return getCategoryById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCategoryByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCategoryByIdHash() => r'33fcc24a526b4a0aa0d08f6ec9f42d1569b673af';

final class GetCategoryByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CategoryEntity?>, String> {
  const GetCategoryByIdFamily._()
    : super(
        retry: null,
        name: r'getCategoryByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCategoryByIdProvider call(String id) =>
      GetCategoryByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'getCategoryByIdProvider';
}
