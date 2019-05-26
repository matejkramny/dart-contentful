// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentfulAsset _$ContentfulAssetFromJson(Map<String, dynamic> json) {
  return ContentfulAsset(
      sys: json['sys'] == null
          ? null
          : ContentfulSystemFields.fromJson(
              json['sys'] as Map<String, dynamic>),
      fields: json['fields'] == null
          ? null
          : ContentfulAssetFields.fromJson(
              json['fields'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ContentfulAssetToJson(ContentfulAsset instance) =>
    <String, dynamic>{'sys': instance.sys, 'fields': instance.fields};

ContentfulAssetFields _$ContentfulAssetFieldsFromJson(
    Map<String, dynamic> json) {
  return ContentfulAssetFields(
      title: json['title'] as String,
      file: json['file'] == null
          ? null
          : ContentfulAssetFile.fromJson(json['file'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ContentfulAssetFieldsToJson(
        ContentfulAssetFields instance) =>
    <String, dynamic>{'title': instance.title, 'file': instance.file};

ContentfulAssetFile _$ContentfulAssetFileFromJson(Map<String, dynamic> json) {
  return ContentfulAssetFile(
      fileName: json['fileName'] as String,
      contentType: json['contentType'] as String,
      url: json['url'] as String,
      details: json['details'] == null
          ? null
          : ContentfulAssetFileDetails.fromJson(
              json['details'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ContentfulAssetFileToJson(
        ContentfulAssetFile instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'contentType': instance.contentType,
      'url': instance.url,
      'details': instance.details
    };

ContentfulAssetFileDetails _$ContentfulAssetFileDetailsFromJson(
    Map<String, dynamic> json) {
  return ContentfulAssetFileDetails(
      size: json['size'] as int,
      image: json['image'] == null
          ? null
          : ContentfulAssetFileDetailsImage.fromJson(
              json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ContentfulAssetFileDetailsToJson(
        ContentfulAssetFileDetails instance) =>
    <String, dynamic>{'size': instance.size, 'image': instance.image};

ContentfulAssetFileDetailsImage _$ContentfulAssetFileDetailsImageFromJson(
    Map<String, dynamic> json) {
  return ContentfulAssetFileDetailsImage(
      height: json['height'] as int, width: json['width'] as int);
}

Map<String, dynamic> _$ContentfulAssetFileDetailsImageToJson(
        ContentfulAssetFileDetailsImage instance) =>
    <String, dynamic>{'height': instance.height, 'width': instance.width};
