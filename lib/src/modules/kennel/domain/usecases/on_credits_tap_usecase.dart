import 'package:url_launcher/url_launcher.dart';

class OnCreditsTapUsecase {
  void call(String uri) {
    launchUrl(
      Uri.parse(uri),
      mode: LaunchMode.inAppWebView,
    );
  }
}
