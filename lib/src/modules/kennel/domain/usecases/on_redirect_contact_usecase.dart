import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

enum ContactType {
  instagram,
  whatsapp,
}

class OnRedirectContactUsecase {
  void call(BuildContext context, ContactType type, String contact) {
    switch (type) {
      case ContactType.instagram:
        launchInstagram(context, contact);
        break;
      case ContactType.whatsapp:
        launchWhatsapp(context, contact);
        break;
      default:
        showAlert(context, 'Contato não cadastrado.');
    }
  }

  @visibleForTesting
  Future<void> launch(
    BuildContext context,
    Uri mainUrl,
    Uri secondUrl,
    Uri androidUrl,
    String errMsg,
    int errCode,
  ) async {
    if (Platform.isAndroid && await canLaunchUrl(androidUrl)) {
      await launchUrl(
        androidUrl,
        mode: LaunchMode.externalApplication,
      );
    } else if (await canLaunchUrl(mainUrl)) {
      await launchUrl(mainUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(secondUrl)) {
      await launchUrl(secondUrl, mode: LaunchMode.inAppWebView);
    } else {
      if (!context.mounted) return;
      showAlert(context, errMsg);
    }
  }

  @visibleForTesting
  Future<void> launchInstagram(BuildContext context, String instagram) async {
    instagram = instagram.trim();
    final nativeInstagram = getNativeInstagramUri(instagram);
    final webInstagram = getWebInstagramUri(instagram);
    final androidInstagram = getWebInstagramUri(instagram);
    // final androidInstagram = getAndroidInstagramUri(instagram);
    await launch(
      context,
      nativeInstagram,
      webInstagram,
      androidInstagram,
      'Não foi possível redirecionar para o Instagram do canil',
      ContactType.instagram.index,
    );
  }

  Future<void> launchWhatsapp(BuildContext context, String whatsapp,
      [String message =
          'O filhote do anúncio ainda está disponível?']) async {
    debugPrint(
        '//TODO: Adicionar uma mensagem personalizada e de pedido de suporte');
    whatsapp = whatsapp.trim().replaceAll(RegExp(r'[^0-9]'), '');

    final nativeWhatsapp = getNativeWhatsAppUri(whatsapp, message);
    final webWhatsapp = getWebWhatsAppUri(whatsapp, message);
    final androidWhatsapp = getAndroidWhatsAppUri(whatsapp, message);
    await launch(
      context,
      nativeWhatsapp,
      webWhatsapp,
      androidWhatsapp,
      'Não foi possível redirecionar para o WhatsApp do canil',
      ContactType.whatsapp.index,
    );
  }

  @visibleForTesting
  Uri getNativeWhatsAppUri(String number, String message) =>
      Uri.parse("whatsapp://send?phone=55$number&text=$message");

  @visibleForTesting
  Uri getWebWhatsAppUri(String number, String message) =>
      Uri.parse("https://api.whatsapp.com/send?phone=55$number&text=$message");

  @visibleForTesting
  Uri getAndroidWhatsAppUri(String number, String message) =>
      Uri.parse("https://wa.me/55$number?text=$message");

  @visibleForTesting
  Uri getNativeInstagramUri(String user) {
    return Uri.parse("instagram://user?username=$user");
  }

  @visibleForTesting
  Uri getAndroidInstagramUri(String user) {
    throw UnimplementedError(
      'Not working properly, please use getWebInstagramUri instead',
    );
    var uri = Uri.parse("instagram://user?username=$user");
    return uri;
  }

  @visibleForTesting
  Uri getWebInstagramUri(String user) {
    return Uri.parse("https://www.instagram.com/$user");
  }

  @visibleForTesting
  void showAlert(BuildContext context, String errMsg) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Algo deu errado'),
        content: Text(errMsg),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
