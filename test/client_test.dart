import 'package:test/test.dart';
import 'package:collection/collection.dart';
import 'package:contentful/client.dart';

void main() {
  Function deepEq = const DeepCollectionEquality().equals;

  group('Includes', () {
    final Map<String, Map<String, dynamic>> linkedEntry = {
      "sys": {
        "type": "Entry",
        "id": "A",
      },
      "fields": {
        "title": "title",
      },
    };

    final includes = Includes.fromJson({
      "Entry": [linkedEntry],
    });

    final linkToEntry = {
      "sys": {"type": "Link", "linkType": "Entry", "id": "A"},
    };

    test('links should be resolved', () {
      final linkingList = [
        {
          "sys": {
            "type": "Entry",
            "id": "B",
          },
          "fields": {
            "links": [
              linkToEntry,
            ],
          },
        }
      ];

      final expectedList = [
        {
          "sys": {
            "type": "Entry",
            "id": "B",
          },
          "fields": {
            "links": [
              linkedEntry,
            ],
          },
        }
      ];

      final resolvedList = includes.resolveLinks(linkingList);

      expect(deepEq(resolvedList, expectedList), true);
    });

    test('list of strings should be preserved', () {
      final linkingList = [
        {
          "sys": {
            "type": "Entry",
            "id": "B",
          },
          "fields": {
            "stringlist": ["str1", "str2"],
          },
        }
      ];

      final expectedList = [
        {
          "sys": {
            "type": "Entry",
            "id": "B",
          },
          "fields": {
            "stringlist": ["str1", "str2"],
          },
        }
      ];

      final resolvedList = includes.resolveLinks(linkingList);

      expect(deepEq(resolvedList, expectedList), true);
    });
  });
}
