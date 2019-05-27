import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../models/entry.dart';

class ContentfulHttpClient extends BaseClient {
  factory ContentfulHttpClient(String accessToken) {
    final client = Client();
    return ContentfulHttpClient._internal(client, accessToken);
  }
  ContentfulHttpClient._internal(this._inner, this.accessToken);

  final Client _inner;
  final String accessToken;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $accessToken';
    return _inner.send(request);
  }
}

class ContentfulApi {
  factory ContentfulApi(
    String spaceId,
    String accessToken, {
    String host = 'cdn.contentful.com',
  }) {
    final client = ContentfulHttpClient(accessToken);
    return ContentfulApi._(client, spaceId, host: host);
  }
  ContentfulApi._(
    this._client,
    this.spaceId, {
    this.host,
  });

  final ContentfulHttpClient _client;
  final String spaceId;
  final String host;

  Uri _uri(String path, {Map<String, dynamic> params}) => Uri(
        scheme: 'https',
        host: host,
        path: '/spaces/$spaceId/environments/master$path',
        queryParameters: params,
      );

  void close() {
    this._client.close();
  }

  Future<T> getEntry<T extends ContentfulEntry>(
    String id,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic> params,
  }) async {
    final response = await _client.get(_uri('/entries/$id', params: params));
    if (response.statusCode != 200) {
      throw Exception('getEntry failed');
    }
    return fromJson(json.decode(response.body));
  }

  Future<ContentfulEntryCollection<T>> getEntries<T extends ContentfulEntry>(
    Map<String, dynamic> query,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await _client.get(_uri('/entries', params: query));
    if (response.statusCode != 200) {
      throw Exception('getEntries failed');
    }

    dynamic jsonr = json.decode(response.body);
    if (jsonr['includes'] != null) {
      final includes = ContentfulIncludes.fromJson(jsonr['includes']);
      jsonr['items'] = includes.resolveLinks(jsonr['items']);
    }

    return ContentfulEntryCollection.fromJson(jsonr, fromJson);
  }
}

class ContentfulIncludes {
  factory ContentfulIncludes.fromJson(Map<String, dynamic> json) {
    final map = ContentfulIncludesMap.fromJson(json);

    return ContentfulIncludes(map);
  }

  ContentfulIncludes(this.map);
  final ContentfulIncludesMap map;

  bool _isLink(Map<String, dynamic> entry) {
    return entry['sys'] != null && entry['sys']['type'] == 'Link';
  }

  Map<String, dynamic> _walkMap(Map<String, dynamic> entry) {
    if (_isLink(entry)) {
      final resolved = map.resolveLink(entry);
      return _isLink(resolved) ? entry : _walkMap(resolved);
    } else if (entry['fields'] == null) return entry;

    final fields = entry['fields'] as Map<String, dynamic>;
    entry['fields'] = fields.map((key, fieldJson) {
      if (fieldJson is List) {
        return MapEntry<String, dynamic>(
          key,
          resolveLinks(fieldJson),
        );
      } else if (fieldJson is Map && _isLink(fieldJson)) {
        return MapEntry<String, dynamic>(
          key,
          _walkMap(map.resolveLink(fieldJson)),
        );
      }
      return MapEntry<String, dynamic>(key, fieldJson);
    });
    return entry;
  }

  List<Map<String, dynamic>> resolveLinks(List<dynamic> items) {
    return items.map((item) => _walkMap(item)).toList();
  }
}

class ContentfulIncludesMap {
  factory ContentfulIncludesMap.fromJson(Map<String, dynamic> json) {
    final Map<String, Map<String, Map<String, dynamic>>> map = {};

    json.forEach((type, json) {
      if (map[type] == null) map[type] = {};
      final list = json as List<dynamic>;
      list.forEach((json) {
        final entry = json as Map<String, dynamic>;
        map[type][entry['sys']['id']] = entry;
      });
    });

    return ContentfulIncludesMap(map);
  }

  ContentfulIncludesMap(this._map);

  final Map<String, Map<String, Map<String, dynamic>>> _map;

  Map<String, dynamic> resolveLink(Map<String, dynamic> link) {
    final String type = link['sys']['linkType'];
    final String id = link['sys']['id'];
    if (_map[type] == null || _map[type][id] == null) return link;
    return _map[type][id];
  }
}
