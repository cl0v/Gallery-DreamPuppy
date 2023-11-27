import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/puppy/domain/usecases/on_contact_canil_pressed.dart';

void main() {
  group(
    FirstTimeCanilIdUsecase,
    () {
      test(
        'Verifica se é a primeira vez do canil',
        () async {
          final usecase = FirstTimeCanilIdUsecase();
          expect(usecase.call(1), false);
          expect(usecase.call(2), false);
          expect(usecase.call(1), true, reason: 'Id repetido retorna true');
          expect(usecase.call(3), false);
        },
      );
    },
  );
}
