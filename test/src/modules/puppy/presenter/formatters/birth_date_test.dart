import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/birth_date.dart';

void main() {
  var subject = BirthDateFormatter();
  testWidgets('birth date ...', (tester) async {
    expect(subject.call(json['birth']!), '30 Dez');
    expect(subject.call(json2['birth']!), '11 Jan');
  });
}

var json = {
  "birth": "2023-12-30T18:25:43.511000",
};

var json2 = {
  //2024-01-11T18:25:43.511000
"birth": "2024-01-11T18:25:43",
};
