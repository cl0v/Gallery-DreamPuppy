import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/kennel/domain/usecases/on_redirect_contact_usecase.dart';

void main() {
  var usecase = OnRedirectContactUsecase();
  test('Color delete', () {
    expect(Color.fromARGB(255, 184, 166, 121), '#323232');
  });
  group('Test Whatsapp', () {
    test('iOS uri', () {
      expect(
          usecase.getNativeWhatsAppUri('‪‪34998979582‬‬', ''),
          equals(
            Uri.parse('whatsapp://send/?phone=5534998979582&text='),
          ));
      expect(
          usecase.getNativeWhatsAppUri('34998979582', ''),
          equals(
            Uri.parse('whatsapp://send/?phone=5534998979582&text='),
          ));
    });
    test('Android uri', () {
      expect(
          usecase.getAndroidWhatsAppUri('‪‪34998979582‬‬', ''),
          equals(
            Uri.parse('https://wa.me/phone=5534998979582/?text='),
          ));
      expect(
          usecase.getAndroidWhatsAppUri('34998979582', ''),
          equals(
            Uri.parse('https://wa.me/5534998979582/?text='),
          ));
    });
    test('Web uri', () {
      expect(
          usecase.getWebWhatsAppUri('33998525199', ''),
          equals(
            Uri.parse(
                'https://api.whatsapp.com/send/?phone=5533998525199&text='),
          ));
    });
  });

  group('Test Instagram', () {
    test('iOS uri', () {
      expect(
          usecase.getNativeInstagramUri('dreampuppy.com.br'),
          equals(
            Uri.parse('instagram://user?username=dreampuppy.com.br'),
          ));
    });
    test('Adroid Uri', (){
      expect(
          usecase.getAndroidInstagramUri('dreampuppy.com.br'),
          equals(
            Uri.parse('instagram://user?username=dreampuppy.com.br'),
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
