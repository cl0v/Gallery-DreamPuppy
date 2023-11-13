import 'package:gallery/src/modules/details/domain/usecases/on_get_contact_pressed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    ShouldShowReviewerPopUpUsecase,
    () {
      test(
        'Verifica o funcionamento dos clicks',
        () async {
          final usecase = ShouldShowReviewerPopUpUsecase(3);
          expect(usecase(), false);
          expect(usecase(), false);
          expect(usecase(), true, reason: 'At (3*) click, should redirect');
          expect(usecase(), false);
        },
      );
    },
  );
}
