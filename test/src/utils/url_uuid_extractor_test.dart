import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/utils/url_uuid_extractor.dart';

void main() {
  test(
      'Garante que o link de compartilhamente receba apenas o UUID do filhote e ignore a raça',
      () async {
    var url = 'https://www.dreampuppy.com.br/filhotes/rottweiler-759d452acd6d4754a7443d4cbdd66c60';
    var extracted = extractUuidFromUrl(url);
    expect(extracted, equals('759d452acd6d4754a7443d4cbdd66c60'));
  });
  test(
      'Garante que o link de compartilhamente receba apenas o UUID do filhote',
      () async {
    var url = 'https://www.dreampuppy.com.br/filhotes/759d452acd6d4754a7443d4cbdd66c60';
    var extracted = extractUuidFromUrl(url);
    expect(extracted, equals('759d452acd6d4754a7443d4cbdd66c60'));
  });
}
