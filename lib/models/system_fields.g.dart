// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentfulSystemFields _$ContentfulSystemFieldsFromJson(
    Map<String, dynamic> json) {
  return ContentfulSystemFields(
      id: json['id'] as String,
      type: json['type'] as String,
      space: json['space'] == null
          ? null
          : ContentfulLink.fromJson(json['space'] as Map<String, dynamic>),
      contentType: json['contentType'] == null
          ? null
          : ContentfulLink.fromJson(
              json['contentType'] as Map<String, dynamic>),
      revision: json['revision'] as int,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      locale: json['locale'] as String);
}

Map<String, dynamic> _$ContentfulSystemFieldsToJson(
        ContentfulSystemFields instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'space': instance.space,
      'contentType': instance.contentType,
      'revision': instance.revision,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'locale': instance.locale
    };
