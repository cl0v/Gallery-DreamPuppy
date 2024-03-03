import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/kennel/domain/usecases/on_redirect_contact_usecase.dart';

void main() {
  var usecase = OnRedirectContactUsecase();
  group('Test native uri always valid', () {
    test('Native whatsapp uri', () {
      expect(
          usecase.getNativeWhatsAppUri('‪‪34998979582‬‬', ''),
          equals(
            Uri.parse('whatsapp://send/?phone=5534998979582'),
          ));
      expect(
          usecase.getNativeWhatsAppUri('34998979582', ''),
          equals(
            Uri.parse('whatsapp://send/?phone=5534998979582'),
          ));
    });
    test('Native instagram uri', () {
      expect(
          usecase.getNativeInstagramUri('dreampuppy.com.br'),
          equals(
            Uri.parse('instagram://user?username=dreampuppy.com.br'),
          ));
    });
  });

  group('Test web uri always valid', () {
    test('Web whatsapp uri', () {
      expect(
          usecase.getWebWhatsAppUri('33998525199', ''),
          equals(
            Uri.parse('https://api.whatsapp.com/send/?phone=5533998525199'),
          ));
    });
    test('Web instagram uri', () {
      expect(
          usecase.getWebInstagramUri('dreampuppy.com.br'),
          equals(
            Uri.parse('https://www.instagram.com/dreampuppy.com.br'),
          ));
    });
  });
}
