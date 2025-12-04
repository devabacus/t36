// manifest: startProject
import 'package:freezed_annotation/freezed_annotation.dart';
import 'setting_view_model.dart';

part 'settings_screen_model.freezed.dart';

@freezed
abstract class SettingsScreenModel with _$SettingsScreenModel {
  const factory SettingsScreenModel({
    required String title,
    required List<SettingsSectionModel> sections,
  }) = _SettingsScreenModel;
}

@freezed
abstract class SettingsSectionModel with _$SettingsSectionModel {
  const factory SettingsSectionModel({
    required String title,
    required List<SettingViewModel> settings,
  }) = _SettingsSectionModel;
}