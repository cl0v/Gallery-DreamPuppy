enum RedirectFoward {
  /// Não redireciona, pode receber um erro.
  stay,

  /// Redireciona para a tela de login
  auth,

  /// Redireciona para a tela de dados do canil
  storeDetails,

  /// Redireciona para a tela de dados do canil. Porém o pop-up de avaliação do App
  storeWithReview,

  /// Redireciona para a tela de dados do canil. Porém o pop-up de avaliação do App
  storeWithRemember,
}
}

String? getRouteName(RedirectFoward redir) {
  switch (redir) {
    case RedirectFoward.auth:
      return '/auth';
    case RedirectFoward.storeDetails:
      return '/canil';
    case RedirectFoward.storeWithReview:
      return '/canil?review=';
    case RedirectFoward.storeWithRemember:
      return '/canil?remember=';
    default:
      return null;
  }
}
