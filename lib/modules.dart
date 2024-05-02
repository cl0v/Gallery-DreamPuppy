import 'package:get_it/get_it.dart';

class Module {
  final GetIt ioc;

  Module(this.ioc);

  void init() {}

  List get binds => throw UnimplementedError('Implemente o os Binds do módulo');
}

abstract class AuthModule extends Module {
  AuthModule(super.ioc);
}

abstract class GalleryModule extends Module {
  GalleryModule(super.ioc);
}

abstract class PuppyModule extends Module {
  PuppyModule(super.ioc);
}

abstract class KennelModule extends Module {
  KennelModule(super.ioc);
}
