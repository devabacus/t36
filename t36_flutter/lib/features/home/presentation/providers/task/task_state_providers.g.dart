// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tasks)
const tasksProvider = TasksProvider._();

final class TasksProvider
    extends $AsyncNotifierProvider<Tasks, List<TaskEntity>> {
  const TasksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tasksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tasksHash();

  @$internal
  @override
  Tasks create() => Tasks();
}

String _$tasksHash() => r'2adaaae4bad77b5901aab70d6100b9d447393a06';

abstract class _$Tasks extends $AsyncNotifier<List<TaskEntity>> {
  FutureOr<List<TaskEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<TaskEntity>>, List<TaskEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TaskEntity>>, List<TaskEntity>>,
              AsyncValue<List<TaskEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(tasksStream)
const tasksStreamProvider = TasksStreamProvider._();

final class TasksStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskEntity>>,
          List<TaskEntity>,
          Stream<List<TaskEntity>>
        >
    with $FutureModifier<List<TaskEntity>>, $StreamProvider<List<TaskEntity>> {
  const TasksStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tasksStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tasksStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<TaskEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskEntity>> create(Ref ref) {
    return tasksStream(ref);
  }
}

String _$tasksStreamHash() => r'b97dc89dd4e2cecf7d6576ee7c461e46db656d5e';
