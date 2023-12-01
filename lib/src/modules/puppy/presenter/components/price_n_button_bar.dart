import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/on_contact_kennel_pressed.dart';

class PriceAndButtonBarComponent extends StatelessWidget {
  const PriceAndButtonBarComponent({
    super.key,
    required this.puppy,
  });

  final PuppyDetailsEntity puppy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: TextSpan(
                text: '',
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
                children: [
              const TextSpan(
                text: 'R\$ ',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -2.5),
              ),
              TextSpan(
                text: puppy.price.toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                ),
              ),
              const TextSpan(
                text: ',00',
                style: TextStyle(
                  fontSize: 12,
                  // fontStyle: FontStyle.normal,
                ),
              ),
            ])),
        Semantics(
          label: 'onGoToCanilPage',
          child: CupertinoButton.filled(
            onPressed: () async {
              var usecase = await OnGetContactPressedUsecase().call(puppy.id);
              var shouldRedirect = false;
              do {
                if (!context.mounted) return;
                shouldRedirect = await context.pushNamed<bool>(
                      usecase.name,
                      pathParameters: usecase.params,
                      queryParameters: usecase.query,
                    ) ??
                    false;
              } while (shouldRedirect);
            },
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text('Sobre o Canil'), // "Falar com o Canil"
          ),
        ),
      ],
    );
  }
}
