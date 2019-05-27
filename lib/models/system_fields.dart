import 'package:json_annotation/json_annotation.dart';
import 'link.dart';
part 'system_fields.g.dart';

@JsonSerializable()
class SystemFields {
  SystemFields({
    this.id,
    this.type,
    this.space,
    this.contentType,
    this.revision,
    this.createdAt,
    this.updatedAt,
    this.locale,
  });

  final String id;
  final String type;
  final Link space;
  final Link contentType;
  final int revision;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String locale;

  factory SystemFields.fromJson(Map<String, dynamic> json) =>
      _$SystemFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$SystemFieldsToJson(this);
}
