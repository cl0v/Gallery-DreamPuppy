import 'package:url_launcher/url_launcher.dart';

class OnCreditsTapUsecase {
  void call() {
    const iconsUrl = 'https://icons8.com.br/license';
    launchUrl(
      Uri.parse(iconsUrl),
      mode: LaunchMode.inAppWebView,
    );
  }
}
