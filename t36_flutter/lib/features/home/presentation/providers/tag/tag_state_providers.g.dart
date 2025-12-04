// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tags)
const tagsProvider = TagsProvider._();

final class TagsProvider extends $AsyncNotifierProvider<Tags, List<TagEntity>> {
  const TagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagsHash();

  @$internal
  @override
  Tags create() => Tags();
}

String _$tagsHash() => r'9ee96484ab60ebaedbc763dd187a4e3e4eca65f5';

abstract class _$Tags extends $AsyncNotifier<List<TagEntity>> {
  FutureOr<List<TagEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<TagEntity>>, List<TagEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TagEntity>>, List<TagEntity>>,
              AsyncValue<List<TagEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(tagsStream)
const tagsStreamProvider = TagsStreamProvider._();

final class TagsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TagEntity>>,
          List<TagEntity>,
          Stream<List<TagEntity>>
        >
    with $FutureModifier<List<TagEntity>>, $StreamProvider<List<TagEntity>> {
  const TagsStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagsStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<TagEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TagEntity>> create(Ref ref) {
    return tagsStream(ref);
  }
}

String _$tagsStreamHash() => r'aae5815c5ce4fd3d7ce5091b360dc66b0c6dd785';
