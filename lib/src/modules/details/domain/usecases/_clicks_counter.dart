part of 'on_get_contact_pressed.dart';

class ShouldShowReviewerPopUpUsecase {
  int limit;

  ShouldShowReviewerPopUpUsecase([this.limit = 7]);

  int counter = 0;

  /// Conta a quantidade de vezes que o user clicou no botão de compra
  bool call() {
    counter++;
    return counter % limit == 0;
  }
}
