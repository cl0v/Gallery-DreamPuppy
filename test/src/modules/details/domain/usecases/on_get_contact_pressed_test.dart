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
            // Não deve contar uma contagem quando a página seguinte a ser exibida é a autenticação.
            expect(usecase.showReview.counter, equals(0));
            authIoC.registerSingleton<UserInfo>(UserInfo(jwt: 'Bearer 123'));
            expect(() => usecase.call(1), returnsNormally);
            expect(usecase.lastPath, '/canil?review=false');
            expect(usecase.showReview.counter, equals(1));

            expect(() => usecase.call(2), returnsNormally);
            expect(usecase.lastPath, RedirectFoward.store().path);
            expect(usecase.lastPath, '/canil?review=false');

            //TODO: Decidir qual a rota que será chamado quando a pessoa acessar outra rota e a opção de remind choise
            //todo: Estiver ativada, evitando confusão.
            // INIT
            expect(usecase.lastPath, RedirectFoward.store(params: '').path,
                skip: true, reason: 'Unimplemented');
            expect(usecase.lastPath, '/canil',
                skip: true, reason: 'Unimplemented');
            // END

            expect(() => usecase.call(1), returnsNormally);
            expect(() => usecase.call(1), returnsNormally);
            expect(() => usecase.call(1), returnsNormally);
            expect(() => usecase.call(3), returnsNormally);
            expect(() => usecase.call(1), returnsNormally);
            expect(
              usecase.showReview.counter,
              equals(usecase.showReview.limit),
            );
            expect(
              usecase.lastPath,
              RedirectFoward.store(params: 'review=true').path,
            );
            expect(usecase.lastPath, '/canil?review=true');
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
