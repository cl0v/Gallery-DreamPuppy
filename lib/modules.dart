import 'package:get_it/get_it.dart';

class Module {
  final GetIt ioc;
  Module(this.ioc);

  get binds => [];
  void init() {}
}

abstract class AuthModule extends Module {
  AuthModule(super.ioc);
}
