// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingGroups)
const settingGroupsProvider = SettingGroupsProvider._();

final class SettingGroupsProvider
    extends
        $FunctionalProvider<
          List<SettingGroup>,
          List<SettingGroup>,
          List<SettingGroup>
        >
    with $Provider<List<SettingGroup>> {
  const SettingGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingGroupsHash();

  @$internal
  @override
  $ProviderElement<List<SettingGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SettingGroup> create(Ref ref) {
    return settingGroups(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SettingGroup> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SettingGroup>>(value),
    );
  }
}

String _$settingGroupsHash() => r'548de69610235b19f4b1f91f5b376f368fdc6d91';
