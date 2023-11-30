part of 'on_contact_kennel_pressed.dart';

enum PopUpType {
  none('false'),

  /// Meu proprio tracker
  show('true'),

  /// Loja do app
  store('store');

  const PopUpType(this.value);

  final String value;
}

class ShowReviewerPopUpUsecase {
  int limit;

  /// Adiciona limite para as Lojas
  int limitStores;

  ShowReviewerPopUpUsecase([this.limit = 7, this.limitStores = 30]);

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
