import 'package:gallery/modules.dart';
import 'package:get_it/get_it.dart';

final canilIoC = GetIt.asNewInstance();

class DefaultCanilModule extends CanilModule {
  DefaultCanilModule(super.ioc);

  @override
  void init() {
    UnimplementedError();
    super.init();
  }
}
