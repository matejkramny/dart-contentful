import 'package:json_annotation/json_annotation.dart';
import 'entry.dart';
import 'system_fields.dart';
part 'asset.g.dart';

@JsonSerializable()
class Asset extends Entry<AssetFields> {
  Asset({
    SystemFields sys,
    AssetFields fields,
  }) : super(sys: sys, fields: fields);

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

@JsonSerializable()
class AssetFields {
  AssetFields({
    this.title,
    this.file,
  });

  final String title;
  final AssetFile file;

  factory AssetFields.fromJson(Map<String, dynamic> json) =>
      _$AssetFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFieldsToJson(this);
}

@JsonSerializable()
class AssetFile {
  AssetFile({
    this.fileName,
    this.contentType,
    this.url,
    this.details,
  });
  final String fileName;
  final String contentType;
  final String url;
  final AssetFileDetails details;

  factory AssetFile.fromJson(Map<String, dynamic> json) =>
      _$AssetFileFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileToJson(this);
}

@JsonSerializable()
class AssetFileDetails {
  AssetFileDetails({
    this.size,
    this.image,
  });
  final int size;
  final AssetFileDetailsImage image;

  factory AssetFileDetails.fromJson(Map<String, dynamic> json) =>
      _$AssetFileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileDetailsToJson(this);
}

@JsonSerializable()
class AssetFileDetailsImage {
  AssetFileDetailsImage({
    this.height,
    this.width,
  });
  final int height;
  final int width;

  factory AssetFileDetailsImage.fromJson(Map<String, dynamic> json) =>
      _$AssetFileDetailsImageFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileDetailsImageToJson(this);
}
