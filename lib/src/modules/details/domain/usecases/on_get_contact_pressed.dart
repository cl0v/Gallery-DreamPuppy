import 'package:flutter/cupertino.dart';
import 'package:gallery/widget.dart';
import '../../../../../modules.dart';
import '../entities/redirect_foward.dart';
import '../entities/user_info.dart';
import 'package:auto_route/auto_route.dart';

part '_first_time_id.dart';
part '_is_auth_required.dart';
part '_clicks_counter.dart';

class OnGetContactPressedUsecase {
  /// Instanciado apenas 1 vez, no início.
  FirstTimeCanilIdUsecase firstTime = FirstTimeCanilIdUsecase();
  ShouldShowReviewerPopUpUsecase showReview = ShouldShowReviewerPopUpUsecase();

  void call(int idCanil) {
    RedirectFoward path = RedirectFoward.stay;
    if (IsAuthRequiredUsecase().call()) {
      path = RedirectFoward.auth;
    }
    if (firstTime.call(idCanil)) {
      path = RedirectFoward.storeDetails;
      if (showReview.call()) {
        path = RedirectFoward.storeWithReview;
      }
    }
    return redirect(path);
  }

  @visibleForTesting
  void redirect(RedirectFoward path) {
    var routeName = getRouteName(path);
    // router.pushNamed('/books');
    //TODO: Verificar se a navegação foi executada corretamente.
    /*
      > Existe a possibilidade do user voltar da tela, após ter enfrentado uma tela de autenticação.
    */

    // Navega para a rota.
    // nav(path);
  }
}
