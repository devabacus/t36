// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_get_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTagById)
const getTagByIdProvider = GetTagByIdFamily._();

final class GetTagByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<TagEntity?>,
          TagEntity?,
          FutureOr<TagEntity?>
        >
    with $FutureModifier<TagEntity?>, $FutureProvider<TagEntity?> {
  const GetTagByIdProvider._({
    required GetTagByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getTagByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTagByIdHash();

  @override
  String toString() {
    return r'getTagByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TagEntity?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TagEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return getTagById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTagByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTagByIdHash() => r'e57a1688d1f13dc33c065bd347c8496f73a68d09';

final class GetTagByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TagEntity?>, String> {
  const GetTagByIdFamily._()
    : super(
        retry: null,
        name: r'getTagByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTagByIdProvider call(String id) =>
      GetTagByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'getTagByIdProvider';
}
