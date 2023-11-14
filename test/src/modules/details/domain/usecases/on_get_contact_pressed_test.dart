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
        test('first call', () {
          usecase = OnGetContactPressedUsecase();
          expect(() => usecase.call(1), returnsNormally);
          expect(usecase.lastPath, equals('/auth'));
        });
        test('navigate to store diff id', () {
          usecase = OnGetContactPressedUsecase();
          expect(() => usecase.call(1), returnsNormally);
          authIoC.registerSingleton<UserInfo>(UserInfo(jwt: 'Bearer 123'));

          expect(() => usecase.call(2), returnsNormally);
          expect(usecase.lastPath, getRouteName(RedirectFoward.storeDetails)!);
          expect(() => usecase.call(1), returnsNormally);
          expect(usecase.lastPath, getRouteName(RedirectFoward.storeDetails)!);
          expect(() => usecase.call(1), returnsNormally);
          expect(() => usecase.call(1), returnsNormally);
          expect(() => usecase.call(1), returnsNormally);
          expect(() => usecase.call(1), returnsNormally);
          expect(
              usecase.lastPath, getRouteName(RedirectFoward.storeWithReview)!);
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
