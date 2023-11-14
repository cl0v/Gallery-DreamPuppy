class RedirectFoward {
  String? path;

  RedirectFoward(this.path);

  /// Não redireciona, pode receber um erro.
  factory RedirectFoward.stay({String? path}) => RedirectFoward(path);

  /// Redireciona para a tela de login
  factory RedirectFoward.auth({String path = '/auth', String params = ''}) =>
      RedirectFoward(
        '$path?$params',
      );

  /// Redireciona para a tela de dados do canil
  factory RedirectFoward.store({String path = '/canil', String params = ''}) =>
      RedirectFoward(
        '$path?$params',
      );
}
