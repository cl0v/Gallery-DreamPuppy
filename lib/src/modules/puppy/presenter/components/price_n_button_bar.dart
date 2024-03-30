import 'package:flutter/cupertino.dart';
import 'package:gallery/src/modules/puppy/domain/entities/puppy_details_entity.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/on_contact_kennel_pressed.dart';

class TalkToKennelWidgetDetailsPage extends StatefulWidget {
  const TalkToKennelWidgetDetailsPage({
    super.key,
    required this.puppy,
  });

  final PuppyDetailsEntity? puppy;

  @override
  State<TalkToKennelWidgetDetailsPage> createState() =>
      _TalkToKennelWidgetDetailsPageState();
}

class _TalkToKennelWidgetDetailsPageState
    extends State<TalkToKennelWidgetDetailsPage> with OneTimeClickButton {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'onGoToKennelPage',
      //TODO: Substituir esse botão pelo do material para Android, pois a google solicita para acessibilidade 44dp para 48
      child: CupertinoButton.filled(
        onPressed: widget.puppy == null
            ? () {}
            : () {
                if (isRedundentClick(DateTime.now())) {
                  return;
                }
                OnGetKennelContactsPressedUsecase()
                    .call(
                  widget.puppy!.id,
                )
                    .then((value) {
                  context.pushNamed<bool>(
                    value.name,
                    pathParameters: value.params,
                    queryParameters: value.query,
                  );
                });
              },
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(widget.puppy == null
            ? 'Sobre o Canil (1)'
            : 'Falar com Canil'), // "Falar com o Canil"
      ),
    );
  }
}

mixin OneTimeClickButton {
  DateTime? loginClickTime;

  bool isRedundentClick(DateTime currentTime, [int maxDiff = 1]) {
    if (loginClickTime == null) {
      loginClickTime = currentTime;
      return false;
    }
    debugPrint('diff is ${currentTime.difference(loginClickTime!).inSeconds}');
    if (currentTime.difference(loginClickTime!).inSeconds < maxDiff) {
      // set this difference time in seconds
      return true;
    }

    loginClickTime = currentTime;
    return false;
  }
}

class PriceWidgetDetailsPage extends StatelessWidget {
  const PriceWidgetDetailsPage({
    super.key,
    required this.puppy,
  });

  final PuppyDetailsEntity puppy;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
            children: [
          TextSpan(
            // Ta muito feio esse design
            text: 'R\$ ',
            style: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                letterSpacing: -2.5),
            //  TextStyle(
            //     fontSize: 28,
            //     color: Colors.black,
            //     fontWeight: FontWeight.w300,
            //     letterSpacing: -2.5),
          ),
          TextSpan(
            text: puppy.price.toString(),
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
          ),
          TextSpan(
            text: ',00',
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 12,
                  // fontStyle: FontStyle.normal,
                ),
          ),
        ]));
  }
}
