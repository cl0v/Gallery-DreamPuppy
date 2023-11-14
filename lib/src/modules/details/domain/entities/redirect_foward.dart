import 'package:gallery/src/commons/utils/routes_helper.dart';

class RedirectFoward {
  String? path;

  RedirectFoward(this.path);

  /// Não redireciona.
  factory RedirectFoward.stay({String? path}) => RedirectFoward(path);

  /// Redireciona para a tela de login
  factory RedirectFoward.auth({String path = '/auth', String params = ''}) =>
      RedirectFoward(RoutesHelper.endpoint(path, params));

  /// Redireciona para a tela de dados do canil
  factory RedirectFoward.store({String path = '/canil', String params = ''}) =>
      RedirectFoward(RoutesHelper.endpoint(path, params));
}
