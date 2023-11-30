import 'dart:convert';
import 'package:mockito/annotations.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/http/url.dart';
import 'package:gallery/src/modules/puppy/data/datasource.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  var client = MockClient();
  var datasource = PuppyDetailsDatasource(client);
  group(
    'on succ',
    () {
      test('get details', () async {
        var response = Response(jsonEncode(exit_json), 200);
        when(
          client.get(Uri.parse('$baseUrl/puppies/11')),
        ).thenAnswer((_) async => response);
        var (data, err) = await datasource.get(11);
        expect(err, equals(null));
        data = data!;
        expect(data.breed, equals("Pug"));
        expect(data.price, equals(3000));
      });
    },
  );
}

final exit_json = {
  "id": 11,
  "breed": "Pug",
  "price": 3000,
  "pedigree": false,
  "gender": -1,
  "birth": "2023-11-02T18:25:43.511000",
  "microchip": false,
  "minimum_age_departure_in_days": 60,
  "vermifuges": [
    {"brand": "ENDAL® PLUS - MSD", "date": "2023-11-22T18:25:43.511000"}
  ],
  "vaccines": [
    {"brand": "Bio Max", "type": "V8", "date": "2023-11-23T18:25:43.511000"}
  ],
  "images": [
    "https://i.imgur.com/4nusSJC.jpeg",
    "https://i.imgur.com/ajzXLgu.jpeg",
    "https://i.imgur.com/jIFeQdT.jpegg"
  ]
};
