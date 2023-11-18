import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/ioc.dart';
import 'package:gallery/modules.dart';
import 'package:gallery/router.dart';
import 'package:gallery/src/modules/auth/module.dart';
import 'package:gallery/src/modules/details/domain/entities/redirect_foward.dart';
import 'package:gallery/src/modules/details/domain/entities/user_info.dart';
import 'package:gallery/src/modules/details/domain/usecases/on_get_contact_pressed.dart';
import 'package:gallery/widget.dart';

import '../../../fakes/auth_module.dart';
import '../../../fakes/fake_router.dart';

void main() {
  var usecase = OnGetContactPressedUsecase();
  setUp(() async {
    getIt.registerSingleton<AppRouter>(FakeRouter());
    appIoC.registerSingleton<AuthModule>(FakeAuthModule(authIoC));
  });
  tearDown(() async {
    await appIoC.reset();
    await getIt.reset();
  });
  group(
    OnGetContactPressedUsecase,
    () {
      test(
        'call',
        () async {
          usecase = OnGetContactPressedUsecase();
          expect(() => usecase(1), returnsNormally);
        },
      );

      group('redirect', () {
        group('unit', () {
          test('first call', () {
            usecase = OnGetContactPressedUsecase();
            expect(() => usecase.call(1), returnsNormally);
            expect(usecase.lastPath, equals('/auth'));
          });
        });
        group('integration', () {
          test('navigate to store diff id', () {
            usecase = OnGetContactPressedUsecase();
            expect(() => usecase.call(1), returnsNormally);
            expect(usecase.lastPath, RedirectFoward.auth().path);
            expect(usecase.lastPath, '/auth');
            expect(usecase.showReview.counter, equals(0));
            authIoC.registerSingleton<UserInfo>(UserInfo(jwt: 'Bearer 123'));

            // Não deve contar uma contagem quando a página seguinte a ser exibida é a autenticação.
            for (var idx = 1; idx < 31; idx++) {
              String showReview = PopUpType.none.value;
              if (idx % 7 == 0) {
                showReview = PopUpType.show.value;
              } else if (idx == 30) {
                showReview = PopUpType.store.value;
              }

              expect(
                () => usecase.call(idx),
                returnsNormally,
              );
              expect(
                usecase.lastPath,
                RedirectFoward.store(params: 'review=$showReview').path,
              );
              expect(
                usecase.showReview.counter,
                equals(idx),
              );
            }
          });
        });

        test('navigate to store same id', skip: true, () {
          usecase = OnGetContactPressedUsecase();
          expect(() => usecase.call(1), returnsNormally);
          authIoC.registerSingleton<UserInfo>(UserInfo(jwt: 'Bearer 123'));

          expect(() => usecase.call(1), returnsNormally);
          expect(appRouter.navigationHistory.isRouteActive('/auth'), true);
        });
      });
    },
  );
}
