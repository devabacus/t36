// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(unassignedTagsForTaskProvider)
const unassignedTagsForTaskProviderProvider =
    UnassignedTagsForTaskProviderFamily._();

final class UnassignedTagsForTaskProviderProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TagEntity>>,
          List<TagEntity>,
          FutureOr<List<TagEntity>>
        >
    with $FutureModifier<List<TagEntity>>, $FutureProvider<List<TagEntity>> {
  const UnassignedTagsForTaskProviderProvider._({
    required UnassignedTagsForTaskProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'unassignedTagsForTaskProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$unassignedTagsForTaskProviderHash();

  @override
  String toString() {
    return r'unassignedTagsForTaskProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TagEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TagEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return unassignedTagsForTaskProvider(ref, taskId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UnassignedTagsForTaskProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$unassignedTagsForTaskProviderHash() =>
    r'107c507be219b4c579bd803953dbebe7c55d7fb4';

final class UnassignedTagsForTaskProviderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TagEntity>>, String> {
  const UnassignedTagsForTaskProviderFamily._()
    : super(
        retry: null,
        name: r'unassignedTagsForTaskProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UnassignedTagsForTaskProviderProvider call({required String taskId}) =>
      UnassignedTagsForTaskProviderProvider._(argument: taskId, from: this);

  @override
  String toString() => r'unassignedTagsForTaskProviderProvider';
}
