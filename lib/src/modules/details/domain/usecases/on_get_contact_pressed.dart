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
    RedirectFoward path = RedirectFoward.stay();
    var isUserRequired = IsAuthRequiredUsecase().call();
    if (isUserRequired) {
      // IMP: O user irá entrar e precisará retornar, no lugar de ir pra frente. 
      path = RedirectFoward.auth();
      // TODO: O que acontece se o proprio auth invocar novamente esse metodo depois da auth?
    } else {
      if (firstTime.call(idCanil)) {
        path = RedirectFoward.store(params: 'remember=false');
      } else if (showReview.call()) {
        path = RedirectFoward.store();
      }
      path = RedirectFoward.store();
    }
    return redirect(path);
  }

  @visibleForTesting
  String lastPath = '';

  @visibleForTesting
  void redirect(RedirectFoward redir) {
    /* *!* Verificar se a navegação foi executada corretamente.
      > Existe a possibilidade do user voltar da tela, após ter enfrentado uma tela de autenticação.
    */
    if (redir.path == null) {
      return;
    }
    lastPath = redir.path ?? lastPath;
    appRouter.pushNamed(lastPath);
  }
}
