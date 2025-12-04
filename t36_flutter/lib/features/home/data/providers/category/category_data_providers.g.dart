// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoryDao)
const categoryDaoProvider = CategoryDaoProvider._();

final class CategoryDaoProvider
    extends $FunctionalProvider<CategoryDao, CategoryDao, CategoryDao>
    with $Provider<CategoryDao> {
  const CategoryDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryDaoHash();

  @$internal
  @override
  $ProviderElement<CategoryDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CategoryDao create(Ref ref) {
    return categoryDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryDao>(value),
    );
  }
}

String _$categoryDaoHash() => r'12ec13ec2a0334db5a2e6ada2eeccb88d40f9762';

@ProviderFor(categoryLocalDataSource)
const categoryLocalDataSourceProvider = CategoryLocalDataSourceProvider._();

final class CategoryLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ICategoryLocalDataSource,
          ICategoryLocalDataSource,
          ICategoryLocalDataSource
        >
    with $Provider<ICategoryLocalDataSource> {
  const CategoryLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ICategoryLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICategoryLocalDataSource create(Ref ref) {
    return categoryLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICategoryLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICategoryLocalDataSource>(value),
    );
  }
}

String _$categoryLocalDataSourceHash() =>
    r'03e5408e95291c441ab3640dd2617c45c2c0d4e2';

@ProviderFor(categoryRemoteDataSource)
const categoryRemoteDataSourceProvider = CategoryRemoteDataSourceProvider._();

final class CategoryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ICategoryRemoteDataSource,
          ICategoryRemoteDataSource,
          ICategoryRemoteDataSource
        >
    with $Provider<ICategoryRemoteDataSource> {
  const CategoryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ICategoryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICategoryRemoteDataSource create(Ref ref) {
    return categoryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICategoryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICategoryRemoteDataSource>(value),
    );
  }
}

String _$categoryRemoteDataSourceHash() =>
    r'6bee0ea838bfd7c946e03f75b5137cafdbf79fea';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

@ProviderFor(categoryRepository)
const categoryRepositoryProvider = CategoryRepositoryFamily._();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class CategoryRepositoryProvider
    extends
        $FunctionalProvider<
          ICategoryRepository,
          ICategoryRepository,
          ICategoryRepository
        >
    with $Provider<ICategoryRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  const CategoryRepositoryProvider._({
    required CategoryRepositoryFamily super.from,
    required ({int userId, String customerId}) super.argument,
  }) : super(
         retry: null,
         name: r'categoryRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryRepositoryHash();

  @override
  String toString() {
    return r'categoryRepositoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ICategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICategoryRepository create(Ref ref) {
    final argument = this.argument as ({int userId, String customerId});
    return categoryRepository(
      ref,
      userId: argument.userId,
      customerId: argument.customerId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICategoryRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryRepositoryHash() =>
    r'2c5565e080561ea2f7cc05ae7ff13560ee448522';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class CategoryRepositoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ICategoryRepository,
          ({int userId, String customerId})
        > {
  const CategoryRepositoryFamily._()
    : super(
        retry: null,
        name: r'categoryRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория

  CategoryRepositoryProvider call({
    required int userId,
    required String customerId,
  }) => CategoryRepositoryProvider._(
    argument: (userId: userId, customerId: customerId),
    from: this,
  );

  @override
  String toString() => r'categoryRepositoryProvider';
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

@ProviderFor(currentUserCategoryRepository)
const currentUserCategoryRepositoryProvider =
    CurrentUserCategoryRepositoryProvider._();

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

final class CurrentUserCategoryRepositoryProvider
    extends
        $FunctionalProvider<
          ICategoryRepository?,
          ICategoryRepository?,
          ICategoryRepository?
        >
    with $Provider<ICategoryRepository?> {
  /// Удобный провайдер для получения репозитория текущего пользователя
  /// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
  const CurrentUserCategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserCategoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserCategoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<ICategoryRepository?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICategoryRepository? create(Ref ref) {
    return currentUserCategoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICategoryRepository? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICategoryRepository?>(value),
    );
  }
}

String _$currentUserCategoryRepositoryHash() =>
    r'4dc7edc5e99712febaca763d69972e07a71dd42d';
