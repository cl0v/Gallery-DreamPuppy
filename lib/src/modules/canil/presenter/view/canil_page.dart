import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/canil/domain/entities/canil_contact.dart';
import 'package:gallery/src/modules/canil/domain/entities/canil_details.dart';
import 'package:gallery/src/modules/canil/domain/usecases/on_credits_tap_usecase.dart';
import 'package:gallery/src/modules/canil/domain/usecases/on_redirect_contact_usecase.dart';
import 'package:gallery/src/modules/canil/presenter/components/social_button.dart';
import 'package:gap/gap.dart';

//TODO: Get canil id from previous route.
@RoutePage()
class CanilPage extends StatefulWidget {
  const CanilPage({super.key});

  @override
  State<CanilPage> createState() => _CanilPageState();
}

class _CanilPageState extends State<CanilPage> {
  Future<CanilDetails> fc = Future.delayed(
    const Duration(seconds: 2),
    () => CanilDetails(name: 'Canil Beira Mar', contacts: [
      CanilContactInfo(type: ContactType.whatsapp, contact: '5533998525199'),
      CanilContactInfo(
          type: ContactType.instagram, contact: 'dreampuppy.com.br')
    ]),
  );

  CanilContactInfo? availableContact(
          CanilDetails canil, ContactType searchType) =>
      canil.contacts.firstWhere((cont) => cont.type == searchType);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text('Contate o Canil')),
      child: SafeArea(
        child: FutureBuilder<CanilDetails>(
            future: fc,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularLoadingWidget(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                final canil = snapshot.data!;
                final instagramBtn =
                    availableContact(canil, ContactType.instagram) != null
                        ? () => OnRedirectContactUsecase().call(
                            context,
                            availableContact(
                              canil,
                              ContactType.instagram,
                            )!)
                        : null;
                final whatsappBtn =
                    availableContact(canil, ContactType.whatsapp) != null
                        ? () => OnRedirectContactUsecase().call(
                            context,
                            availableContact(
                              canil,
                              ContactType.whatsapp,
                            )!)
                        : null;
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MaxGap(16),
                    Center(
                        child: Text(
                      canil.name,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontSize: 24),
                    )),
                    const Gap(8),
                    const Text('Localizado em Vitória da Conquista - BA'),
                    const MaxGap(32),
                    SocialButtonWidget(
                      icon: Assets.icons.icons8Whatsapp48.image(height: 26),
                      text: 'WhatsApp',
                      onPressed: whatsappBtn,
                      color: const Color.fromARGB(0xFF, 0x07, 0x5e, 0x54),
                    ),
                    const Gap(8),
                    SocialButtonWidget(
                      icon: Assets.icons.icons8Instagram48.image(height: 26),
                      text: 'Instagram',
                      onPressed: instagramBtn,
                      color: const Color.fromARGB(0xFF, 0xbc, 0x2a, 0x8d),
                    ),
                   
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Versão 1.0.0 (1)'),
                        const Text('© 2021-2023 DreamPuppy Ltda.'),
                        RichText(
                          text: TextSpan(
                            text: 'Icons by ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Icons8',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    OnCreditsTapUsecase().call();
                                  },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        )
                        // RichText(
                        //     text: const TextSpan(
                        //         text: '© 2021-2023 DreamPuppy Ltda.',
                        //         children: [
                        //       TextSpan(text: 'Icons by Icons8'),
                        //     ])),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Não foi possível carregar a página.'),
                );
              }
            }),
      ),
    );
  }
}
