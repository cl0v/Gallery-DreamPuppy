import 'package:gallery/src/modules/puppy/domain/usecases/on_contact_kennel_pressed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    ShowReviewerPopUpUsecase,
    () {
      test(
        'Verifica o funcionamento dos clicks',
        () async {
          final usecase = ShowReviewerPopUpUsecase(2, 3);
          expect(usecase(), PopUpType.none);
          expect(usecase(), PopUpType.show);
          expect(usecase(), PopUpType.store);
        },
      );
    },
  );
}
