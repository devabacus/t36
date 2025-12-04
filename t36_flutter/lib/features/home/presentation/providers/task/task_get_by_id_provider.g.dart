// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_get_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTaskById)
const getTaskByIdProvider = GetTaskByIdFamily._();

final class GetTaskByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<TaskEntity?>,
          TaskEntity?,
          FutureOr<TaskEntity?>
        >
    with $FutureModifier<TaskEntity?>, $FutureProvider<TaskEntity?> {
  const GetTaskByIdProvider._({
    required GetTaskByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getTaskByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTaskByIdHash();

  @override
  String toString() {
    return r'getTaskByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TaskEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TaskEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return getTaskById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTaskByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTaskByIdHash() => r'332614297f3cd16c1740322ae985c1df0bca567b';

final class GetTaskByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TaskEntity?>, String> {
  const GetTaskByIdFamily._()
    : super(
        retry: null,
        name: r'getTaskByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTaskByIdProvider call(String id) =>
      GetTaskByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'getTaskByIdProvider';
}
