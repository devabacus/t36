// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taskDao)
const taskDaoProvider = TaskDaoProvider._();

final class TaskDaoProvider
    extends $FunctionalProvider<TaskDao, TaskDao, TaskDao>
    with $Provider<TaskDao> {
  const TaskDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskDaoHash();

  @$internal
  @override
  $ProviderElement<TaskDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TaskDao create(Ref ref) {
    return taskDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskDao>(value),
    );
  }
}

String _$taskDaoHash() => r'1a599230984fa7a5a8842129f9af3776d913324a';

@ProviderFor(taskLocalDataSource)
const taskLocalDataSourceProvider = TaskLocalDataSourceProvider._();

final class TaskLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ITaskLocalDataSource,
          ITaskLocalDataSource,
          ITaskLocalDataSource
        >
    with $Provider<ITaskLocalDataSource> {
  const TaskLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ITaskLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ITaskLocalDataSource create(Ref ref) {
    return taskLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITaskLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITaskLocalDataSource>(value),
    );
  }
}

String _$taskLocalDataSourceHash() =>
    r'72d225bc8ecdb603bee4a10a79a6a3c7ddd07dd6';

@ProviderFor(taskRemoteDataSource)
const taskRemoteDataSourceProvider = TaskRemoteDataSourceProvider._();

final class TaskRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ITaskRemoteDataSource,
          ITaskRemoteDataSource,
          ITaskRemoteDataSource
        >
    with $Provider<ITaskRemoteDataSource> {
  const TaskRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ITaskRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ITaskRemoteDataSource create(Ref ref) {
    return taskRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITaskRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITaskRemoteDataSource>(value),
    );
  }
}

String _$taskRemoteDataSourceHash() =>
    r'37fa4028a3ed32a90e22c0c20ac2aaf521c7e0b0';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

@ProviderFor(taskRepository)
const taskRepositoryProvider = TaskRepositoryFamily._();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class TaskRepositoryProvider
    extends
        $FunctionalProvider<ITaskRepository, ITaskRepository, ITaskRepository>
    with $Provider<ITaskRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  const TaskRepositoryProvider._({
    required TaskRepositoryFamily super.from,
    required ({int userId, String customerId}) super.argument,
  }) : super(
         retry: null,
         name: r'taskRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$taskRepositoryHash();

  @override
  String toString() {
    return r'taskRepositoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ITaskRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITaskRepository create(Ref ref) {
    final argument = this.argument as ({int userId, String customerId});
    return taskRepository(
      ref,
      userId: argument.userId,
      customerId: argument.customerId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITaskRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITaskRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskRepositoryHash() => r'892ee12ae0dcc102d3c36f0d6b0e8a234b189933';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class TaskRepositoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ITaskRepository,
          ({int userId, String customerId})
        > {
  const TaskRepositoryFamily._()
    : super(
        retry: null,
        name: r'taskRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория

  TaskRepositoryProvider call({
    required int userId,
    required String customerId,
  }) => TaskRepositoryProvider._(
    argument: (userId: userId, customerId: customerId),
    from: this,
  );

  @override
  String toString() => r'taskRepositoryProvider';
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

@ProviderFor(currentUserTaskRepository)
const currentUserTaskRepositoryProvider = CurrentUserTaskRepositoryProvider._();

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

final class CurrentUserTaskRepositoryProvider
    extends
        $FunctionalProvider<
          ITaskRepository?,
          ITaskRepository?,
          ITaskRepository?
        >
    with $Provider<ITaskRepository?> {
  /// Удобный провайдер для получения репозитория текущего пользователя
  /// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
  const CurrentUserTaskRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserTaskRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserTaskRepositoryHash();

  @$internal
  @override
  $ProviderElement<ITaskRepository?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITaskRepository? create(Ref ref) {
    return currentUserTaskRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITaskRepository? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITaskRepository?>(value),
    );
  }
}

String _$currentUserTaskRepositoryHash() =>
    r'3e06710e995c077da874e0e58af38d87dd76ab88';
