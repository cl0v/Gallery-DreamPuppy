part of 'on_contact_kennel_pressed.dart';

class FirstTimeCanilIdUsecase {
  List<int> ids = [];

  /// Verifica se é a primeira vez acessando o id do Canil.
  bool call(int id) {
    var tmp = ids.contains(id);
    if (!tmp) {
      ids.add(id);
    }
    return tmp;
  }
}