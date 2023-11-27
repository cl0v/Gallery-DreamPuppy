import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/widget.dart';
import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/auth/auth_module.dart';
import 'package:gallery/src/modules/puppy/domain/entities/user_info.dart';
import 'package:gallery/src/modules/puppy/domain/usecases/on_contact_canil_pressed.dart';

import '../../../fakes/auth_module.dart';

void main() {
  group(
    IsAuthRequiredUsecase,
    () {
      setUp(() {
        appIoC.registerSingleton<AuthModule>(FakeAuthModule(authIoC));
      });
      test('call', () async {
        final usecase = IsAuthRequiredUsecase();
        expect(usecase(), true);
        authIoC.registerSingleton<UserInfo>(UserInfo(jwt: 'Bearer 123'));
        expect(usecase(), false);
      });
    },
  );
}
