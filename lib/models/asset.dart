import 'package:json_annotation/json_annotation.dart';
import 'entry.dart';
import 'system_fields.dart';
part 'asset.g.dart';

@JsonSerializable()
class ContentfulAsset extends ContentfulEntry<ContentfulAssetFields> {
  ContentfulAsset({
    ContentfulSystemFields sys,
    ContentfulAssetFields fields,
  }) : super(sys: sys, fields: fields);

  factory ContentfulAsset.fromJson(Map<String, dynamic> json) =>
      _$ContentfulAssetFromJson(json);

  Map<String, dynamic> toJson() => _$ContentfulAssetToJson(this);
}

@JsonSerializable()
class ContentfulAssetFields {
  ContentfulAssetFields({
    this.title,
    this.file,
  });

  final String title;
  final ContentfulAssetFile file;

  factory ContentfulAssetFields.fromJson(Map<String, dynamic> json) =>
      _$ContentfulAssetFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentfulAssetFieldsToJson(this);
}

@JsonSerializable()
class ContentfulAssetFile {
  ContentfulAssetFile({
    this.fileName,
    this.contentType,
    this.url,
    this.details,
  });
  final String fileName;
  final String contentType;
  final String url;
  final ContentfulAssetFileDetails details;

  factory ContentfulAssetFile.fromJson(Map<String, dynamic> json) =>
      _$ContentfulAssetFileFromJson(json);

  Map<String, dynamic> toJson() => _$ContentfulAssetFileToJson(this);
}

@JsonSerializable()
class ContentfulAssetFileDetails {
  ContentfulAssetFileDetails({
    this.size,
    this.image,
  });
  final int size;
  final ContentfulAssetFileDetailsImage image;

  factory ContentfulAssetFileDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentfulAssetFileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentfulAssetFileDetailsToJson(this);
}

@JsonSerializable()
class ContentfulAssetFileDetailsImage {
  ContentfulAssetFileDetailsImage({
    this.height,
    this.width,
  });
  final int height;
  final int width;

  factory ContentfulAssetFileDetailsImage.fromJson(Map<String, dynamic> json) =>
      _$ContentfulAssetFileDetailsImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContentfulAssetFileDetailsImageToJson(this);
}
