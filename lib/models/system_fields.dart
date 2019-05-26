import 'package:json_annotation/json_annotation.dart';
import 'link.dart';
part 'system_fields.g.dart';

@JsonSerializable()
class ContentfulSystemFields {
  ContentfulSystemFields({
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
  final ContentfulLink space;
  final ContentfulLink contentType;
  final int revision;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String locale;

  factory ContentfulSystemFields.fromJson(Map<String, dynamic> json) =>
      _$ContentfulSystemFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentfulSystemFieldsToJson(this);
}
