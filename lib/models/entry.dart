import 'system_fields.dart';

abstract class ContentfulEntry<T> {
  ContentfulEntry({
    this.sys,
    this.fields,
  });

  final ContentfulSystemFields sys;
  final T fields;
}

class ContentfulEntryCollection<T extends ContentfulEntry> {
  ContentfulEntryCollection({
    this.total,
    this.skip,
    this.limit,
    this.items,
  });

  final int total;
  final int skip;
  final int limit;
  final List<T> items;

  factory ContentfulEntryCollection.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) =>
      ContentfulEntryCollection(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        items: json['items'].map<T>((jsonItem) => fromJson(jsonItem)).toList(),
      );
}
