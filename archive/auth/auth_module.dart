import 'package:gallery/modules.dart';
import 'package:get_it/get_it.dart';

final authIoC = GetIt.asNewInstance();

class DefaultAuthModule extends AuthModule {
  DefaultAuthModule(super.ioc);

  @override
  init() {}
}
