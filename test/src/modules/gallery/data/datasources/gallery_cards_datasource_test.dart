import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/http/endpoint.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'gallery_cards_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  var client = MockClient();
  var datasource = GalleryCardsDatasourceImpl(client);

  group(
    'on Success',
    () {
      test('get details', () async {
        var response = Response(jsonEncode(exitJson), 200);
        int amount = 10;

        when(
          client.get(Uri.parse('$baseUrl/gallery?size=3&page=1')),
        ).thenAnswer(
          (_) async => response,
        );

        var (data, err) = await datasource.getEntities(amount, 1);

        expect(err, equals(null));
        expect(data?.cards.first.id, equals(11));
        expect(data?.cards.first.url, equals("https://i.imgur.com/4nusSJC.jpeg"));
        expect(data?.cards.last.id, equals(116));
        expect(
            data?.cards.last.url,
            equals(
              "https://devapigallery.blob.core.windows.net/bbac8099910041cfa3cd8f9f869d25f3/546877e157a44b4d9f8728f20bc0183c.jpeg",
            ));
      });
    },
  );
}

final List<Map> exitJson = <Map>[
  {"id": 11, "url": "https://i.imgur.com/4nusSJC.jpeg"},
  {"id": 15, "url": "https://i.imgur.com/4nusSJC.jpeg"},
  {"id": 20, "url": "https://i.imgur.com/4nusSJC.jpeg"},
  {
    "id": 111,
    "url":
        "https://devapigallery.blob.core.windows.net/501bfec674294a549c8c8f94b246a401/640f219c24104dfaa60066d5b487e386.jpeg"
  },
  {
    "id": 114,
    "url":
        "https://devapigallery.blob.core.windows.net/c68313bdf9154f3f9c572d8f5b43039d/08b3921614f74a4f9233a5609ba9a774.octet-stream"
  },
  {
    "id": 115,
    "url":
        "https://devapigallery.blob.core.windows.net/d6f1bd49a1a0465baf2c7144d2cf879f/6cb0c9536c214d59a0bc19be43dd3f04.jpeg"
  },
  {
    "id": 116,
    "url":
        "https://devapigallery.blob.core.windows.net/bbac8099910041cfa3cd8f9f869d25f3/546877e157a44b4d9f8728f20bc0183c.jpeg"
  }
];
