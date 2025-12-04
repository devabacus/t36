// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configurationDao)
const configurationDaoProvider = ConfigurationDaoProvider._();

final class ConfigurationDaoProvider
    extends
        $FunctionalProvider<
          ConfigurationDao,
          ConfigurationDao,
          ConfigurationDao
        >
    with $Provider<ConfigurationDao> {
  const ConfigurationDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationDaoHash();

  @$internal
  @override
  $ProviderElement<ConfigurationDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConfigurationDao create(Ref ref) {
    return configurationDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigurationDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigurationDao>(value),
    );
  }
}

String _$configurationDaoHash() => r'62536fc24f8539d26616fefc8b28b642f7d533a8';

@ProviderFor(configurationRemoteDataSource)
const configurationRemoteDataSourceProvider =
    ConfigurationRemoteDataSourceProvider._();

final class ConfigurationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          IConfigurationRemoteDataSource,
          IConfigurationRemoteDataSource,
          IConfigurationRemoteDataSource
        >
    with $Provider<IConfigurationRemoteDataSource> {
  const ConfigurationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<IConfigurationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationRemoteDataSource create(Ref ref) {
    return configurationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$configurationRemoteDataSourceHash() =>
    r'9818702f9ddf670e5ab81c0b27dc36a092c2f9ef';

@ProviderFor(configurationLocalDataSource)
const configurationLocalDataSourceProvider =
    ConfigurationLocalDataSourceProvider._();

final class ConfigurationLocalDataSourceProvider
    extends
        $FunctionalProvider<
          IConfigurationLocalDataSource,
          IConfigurationLocalDataSource,
          IConfigurationLocalDataSource
        >
    with $Provider<IConfigurationLocalDataSource> {
  const ConfigurationLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<IConfigurationLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationLocalDataSource create(Ref ref) {
    return configurationLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationLocalDataSource>(
        value,
      ),
    );
  }
}

String _$configurationLocalDataSourceHash() =>
    r'237a77839e4005e91f20f898235e6f1a68bd10d1';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

@ProviderFor(configurationRepository)
const configurationRepositoryProvider = ConfigurationRepositoryFamily._();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class ConfigurationRepositoryProvider
    extends
        $FunctionalProvider<
          IConfigurationRepository,
          IConfigurationRepository,
          IConfigurationRepository
        >
    with $Provider<IConfigurationRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  const ConfigurationRepositoryProvider._({
    required ConfigurationRepositoryFamily super.from,
    required ({int userId, String customerId}) super.argument,
  }) : super(
         retry: null,
         name: r'configurationRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$configurationRepositoryHash();

  @override
  String toString() {
    return r'configurationRepositoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<IConfigurationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationRepository create(Ref ref) {
    final argument = this.argument as ({int userId, String customerId});
    return configurationRepository(
      ref,
      userId: argument.userId,
      customerId: argument.customerId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConfigurationRepositoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$configurationRepositoryHash() =>
    r'e95a78487ba282fae90a2c954fd0b7f2c9e453d2';

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория

final class ConfigurationRepositoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          IConfigurationRepository,
          ({int userId, String customerId})
        > {
  const ConfigurationRepositoryFamily._()
    : super(
        retry: null,
        name: r'configurationRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория

  ConfigurationRepositoryProvider call({
    required int userId,
    required String customerId,
  }) => ConfigurationRepositoryProvider._(
    argument: (userId: userId, customerId: customerId),
    from: this,
  );

  @override
  String toString() => r'configurationRepositoryProvider';
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

@ProviderFor(currentUserConfigurationRepository)
const currentUserConfigurationRepositoryProvider =
    CurrentUserConfigurationRepositoryProvider._();

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий

final class CurrentUserConfigurationRepositoryProvider
    extends
        $FunctionalProvider<
          IConfigurationRepository?,
          IConfigurationRepository?,
          IConfigurationRepository?
        >
    with $Provider<IConfigurationRepository?> {
  /// Удобный провайдер для получения репозитория текущего пользователя
  /// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
  const CurrentUserConfigurationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserConfigurationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$currentUserConfigurationRepositoryHash();

  @$internal
  @override
  $ProviderElement<IConfigurationRepository?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationRepository? create(Ref ref) {
    return currentUserConfigurationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationRepository? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationRepository?>(value),
    );
  }
}

String _$currentUserConfigurationRepositoryHash() =>
    r'4db7f219fc6edf960d349cfca15370fea5b3647a';
