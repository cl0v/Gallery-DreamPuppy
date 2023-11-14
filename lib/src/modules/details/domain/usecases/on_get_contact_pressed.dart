import 'package:flutter/cupertino.dart';
import 'package:gallery/router.dart';
import 'package:gallery/src/modules/auth/module.dart';
import '../entities/redirect_foward.dart';
import '../entities/user_info.dart';
part '_first_time_id.dart';
part '_is_auth_required.dart';
part '_clicks_counter.dart';

class OnGetContactPressedUsecase {
  FirstTimeCanilIdUsecase firstTime = FirstTimeCanilIdUsecase();
  ShouldShowReviewerPopUpUsecase showReview = ShouldShowReviewerPopUpUsecase();

  OnGetContactPressedUsecase();

  void call(int idCanil) {
    RedirectFoward path = RedirectFoward.stay;
    var isUserRequired = IsAuthRequiredUsecase().call();
    if (isUserRequired) {
      path = RedirectFoward.auth;
    } else {
      if (firstTime.call(idCanil)) {
        path = RedirectFoward.storeDetails;
      } else if (showReview.call()) {
        path = RedirectFoward.storeWithReview;
      }
      path = RedirectFoward.storeDetails;
    }
    return redirect(path);
  }

  @visibleForTesting
  String lastPath = '';

  @visibleForTesting
  void redirect(RedirectFoward path) {
    var routeName = getRouteName(path);
    /* *!* Verificar se a navegação foi executada corretamente.
      > Existe a possibilidade do user voltar da tela, após ter enfrentado uma tela de autenticação.
    */
    if (routeName == null) {
      return;
    }
    lastPath = routeName;
    appRouter.pushNamed(routeName);
  }
}
