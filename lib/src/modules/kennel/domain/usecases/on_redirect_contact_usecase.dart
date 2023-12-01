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
    Uri? secondUrl,
    String errMsg,
    int errCode,
  ) async {
    if (await canLaunchUrl(mainUrl)) {
      await launchUrl(mainUrl, mode: LaunchMode.externalApplication);
    } else if (secondUrl != null && await canLaunchUrl(secondUrl)) {
      await launchUrl(secondUrl, mode: LaunchMode.inAppWebView);
    } else {
      if (!context.mounted) return;
      showAlert(context, errMsg);
    }
  }

  @visibleForTesting
  Future<void> launchInstagram(BuildContext context, String instagram) async {
    final nativeInstagram = Uri.parse("instagram://user?username=$instagram");
    final webInstagram = Uri.parse("https://www.instagram.com/$instagram");
    launch(
      context,
      nativeInstagram,
      webInstagram,
      'Não foi possível redirecionar para o Instagram do canil',
      ContactType.instagram.index,
    );
  }

  Future<void> launchWhatsapp(BuildContext context, String whatsapp) async {
    final nativeInstagram = Uri.parse("whatsapp://send?phone=$whatsapp");
    final webInstagram =
        Uri.parse("https://api.whatsapp.com/send?phone=$whatsapp");
    launch(
      context,
      nativeInstagram,
      webInstagram,
      'Não foi possível redirecionar para o WhatsApp do canil',
      ContactType.whatsapp.index,
    );
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
