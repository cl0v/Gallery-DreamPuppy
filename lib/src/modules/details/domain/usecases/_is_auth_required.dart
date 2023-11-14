part of 'on_get_contact_pressed.dart';

class IsAuthRequiredUsecase {
  /// Verifica se o user precisa autenticar.
  bool call() {
    var isUserAvailable = authIoC.isRegistered<UserInfo>();
    return !isUserAvailable;
  }
}
