import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/birth_date.dart';

void main() {
  test('birth date', () async {
    expect(BirthDateFormatter.call(json['birth']!), '30 Dez 23');
    expect(BirthDateFormatter.call(json2['birth']!), '11 Jan 24');
  });
}

var json = {
  "birth": "2023-12-30T18:25:43.511000",
};

var json2 = {
  //2024-01-11T18:25:43.511000
  "birth": "2024-01-11T18:25:43",
};
