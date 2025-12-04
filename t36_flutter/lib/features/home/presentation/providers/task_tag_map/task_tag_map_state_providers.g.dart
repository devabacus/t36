// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RelatedTagsForTask)
const relatedTagsForTaskProvider = RelatedTagsForTaskFamily._();

final class RelatedTagsForTaskProvider
    extends $AsyncNotifierProvider<RelatedTagsForTask, List<TagEntity>> {
  const RelatedTagsForTaskProvider._({
    required RelatedTagsForTaskFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'relatedTagsForTaskProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$relatedTagsForTaskHash();

  @override
  String toString() {
    return r'relatedTagsForTaskProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RelatedTagsForTask create() => RelatedTagsForTask();

  @override
  bool operator ==(Object other) {
    return other is RelatedTagsForTaskProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$relatedTagsForTaskHash() =>
    r'464a314d506886de2f9fb3622b03d806c605cff1';

final class RelatedTagsForTaskFamily extends $Family
    with
        $ClassFamilyOverride<
          RelatedTagsForTask,
          AsyncValue<List<TagEntity>>,
          List<TagEntity>,
          FutureOr<List<TagEntity>>,
          String
        > {
  const RelatedTagsForTaskFamily._()
    : super(
        retry: null,
        name: r'relatedTagsForTaskProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RelatedTagsForTaskProvider call(String taskId) =>
      RelatedTagsForTaskProvider._(argument: taskId, from: this);

  @override
  String toString() => r'relatedTagsForTaskProvider';
}

abstract class _$RelatedTagsForTask extends $AsyncNotifier<List<TagEntity>> {
  late final _$args = ref.$arg as String;
  String get taskId => _$args;

  FutureOr<List<TagEntity>> build(String taskId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
