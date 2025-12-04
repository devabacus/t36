// manifest: startProject
import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_model.freezed.dart';
part 'configuration_model.g.dart';

@freezed
abstract class ConfigurationModel with _$ConfigurationModel {
  const factory ConfigurationModel({
    required String id,
    required int userId,
    required String customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    @Default(false) bool isDeleted,

// === generated_start:freezedConstructor ===
  required String group,
      required String key,
      required String value,
// === generated_end:freezedConstructor ===
    
  }) = _ConfigurationModel;

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => _$ConfigurationModelFromJson(json);
}
