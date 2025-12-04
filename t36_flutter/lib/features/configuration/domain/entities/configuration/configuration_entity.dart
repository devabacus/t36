// manifest: startProject
import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_entity.freezed.dart';
part 'configuration_entity.g.dart';

@freezed
abstract class ConfigurationEntity with _$ConfigurationEntity {
  const factory ConfigurationEntity({
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
    
  }) = _ConfigurationEntity;

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) => _$ConfigurationEntityFromJson(json);
}
