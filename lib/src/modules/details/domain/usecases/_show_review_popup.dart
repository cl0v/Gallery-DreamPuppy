part of 'on_get_contact_pressed.dart';

enum PopUpType {
  none,

  /// Meu proprio tracker
  show(),

  /// Loja do app
  store();

  const PopUpType();
}

class ShowReviewerPopUpUsecase {
  int limit;

  /// Adiciona limite para as Lojas
  int limitStores;

  ShowReviewerPopUpUsecase([this.limit = 7, this.limitStores = 45]);

  int counter = 0;
  //TODO: Garantee only one review per user, save the review note.
  /// Conta a quantidade de vezes que o user clicou no botão de compra
  PopUpType call() {
    counter++;
    var tmp = PopUpType.none;
    if (counter % limit == 0) {
      tmp = PopUpType.show;
    }
    if (counter % limitStores == 0) {
      tmp = PopUpType.store;
    }
    return tmp;
  }
}
