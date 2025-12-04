// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagDao)
const tagDaoProvider = TagDaoProvider._();

final class TagDaoProvider extends $FunctionalProvider<TagDao, TagDao, TagDao>
    with $Provider<TagDao> {
  const TagDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagDaoHash();

  @$internal
  @override
  $ProviderElement<TagDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TagDao create(Ref ref) {
    return tagDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagDao>(value),
    );
  }
}

String _$tagDaoHash() => r'965263acbade480e4321108eee53e80f0c9ce56c';

@ProviderFor(tagLocalDataSource)
const tagLocalDataSourceProvider = TagLocalDataSourceProvider._();

final class TagLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ITagLocalDataSource,
          ITagLocalDataSource,
          ITagLocalDataSource
        >
    with $Provider<ITagLocalDataSource> {
  const TagLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ITagLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ITagLocalDataSource create(Ref ref) {
    return tagLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITagLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITagLocalDataSource>(value),
    );
  }
}

String _$tagLocalDataSourceHash() =>
    r'0a6ff7c90cc43f1f99724bf9bef1d17f458a9fee';

@ProviderFor(tagRemoteDataSource)
const tagRemoteDataSourceProvider = TagRemoteDataSourceProvider._();

final class TagRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ITagRemoteDataSource,
          ITagRemoteDataSource,
          ITagRemoteDataSource
        >
    with $Provider<ITagRemoteDataSource> {
  const TagRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ITagRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ITagRemoteDataSource create(Ref ref) {
    return tagRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITagRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITagRemoteDataSource>(value),
    );
  }
}

String _$tagRemoteDataSourceHash() =>
    r'c41c170478a75a0400c9027e355531f6e70263a1';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

@ProviderFor(tagRepository)
const tagRepositoryProvider = TagRepositoryFamily._();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class TagRepositoryProvider
    extends $FunctionalProvider<ITagRepository, ITagRepository, ITagRepository>
    with $Provider<ITagRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  const TagRepositoryProvider._({
    required TagRepositoryFamily super.from,
    required ({int userId, String customerId}) super.argument,
  }) : super(
         retry: null,
         name: r'tagRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tagRepositoryHash();

  @override
  String toString() {
    return r'tagRepositoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ITagRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITagRepository create(Ref ref) {
    final argument = this.argument as ({int userId, String customerId});
    return tagRepository(
      ref,
      userId: argument.userId,
      customerId: argument.customerId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITagRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITagRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TagRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagRepositoryHash() => r'25be0b57d59690f356bd11540fbd9efd451d6931';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class TagRepositoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ITagRepository,
          ({int userId, String customerId})
        > {
  const TagRepositoryFamily._()
    : super(
        retry: null,
        name: r'tagRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория

  TagRepositoryProvider call({
    required int userId,
    required String customerId,
  }) => TagRepositoryProvider._(
    argument: (userId: userId, customerId: customerId),
    from: this,
  );

  @override
  String toString() => r'tagRepositoryProvider';
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

@ProviderFor(currentUserTagRepository)
const currentUserTagRepositoryProvider = CurrentUserTagRepositoryProvider._();

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

final class CurrentUserTagRepositoryProvider
    extends
        $FunctionalProvider<ITagRepository?, ITagRepository?, ITagRepository?>
    with $Provider<ITagRepository?> {
  /// Удобный провайдер для получения репозитория текущего пользователя
  /// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
  const CurrentUserTagRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserTagRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserTagRepositoryHash();

  @$internal
  @override
  $ProviderElement<ITagRepository?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITagRepository? create(Ref ref) {
    return currentUserTagRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITagRepository? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITagRepository?>(value),
    );
  }
}

String _$currentUserTagRepositoryHash() =>
    r'd0212edb80bce4eb1fe92d7ab938e932b68e91b8';
