import 'package:flutter/cupertino.dart';
import 'package:gallery/src/modules/auth/auth_module.dart';
import '../entities/user_info.dart';
part '_first_time_id.dart';
part '_is_auth_required.dart';
part '_show_review_popup.dart';

class OnGetContactPressedUsecase {
  //TODO: Esse firstTime não será usado até que tenha a possibilidade de marcar pra retornar

  // FirstTimeCanilIdUsecase firstTimeCallingCanilId = FirstTimeCanilIdUsecase();
  // InstantRedirectUsecase instantRedirectUsecase = InstantRedirectUsecase();
  // InstantRedirectUsecase instantRedirectUsecase = InstantRedirectUsecase();
  ShowReviewerPopUpUsecase showReview = ShowReviewerPopUpUsecase();

  Function(Uri uri) navigate;
  OnGetContactPressedUsecase(this.navigate);

  void call(int idCanil) {
    var path = '';
    var params = <String, dynamic>{};
    if (IsAuthRequiredUsecase().call() && false) {
      // IMP: O user irá entrar e precisará retornar, no lugar de ir pra frente.
      path = '/auth';
      // TODO: O que acontece se o proprio auth invocar novamente esse metodo depois da auth?
    } else {
      var entries = <MapEntry<String, dynamic>>[];

      entries.add(MapEntry('review', showReview.call().value));
      params.addEntries(entries);
      
      path = '/canil';
    }

    return redirect(path, params);
  }

  @visibleForTesting
  String lastPath = '';

  @visibleForTesting
  void redirect(String path, Map<String, dynamic> parameters) {
    /* *!* Verificar se a navegação foi executada corretamente.
      > Existe a possibilidade do user voltar da tela, após ter enfrentado uma tela de autenticação.
    */
    if (path.isEmpty) {
      //TODO: Tratar quando o path for nul (apontando pra ele mesmo)
      return;
    }
    navigate.call(Uri(path: path, queryParameters: parameters));
  }
}
