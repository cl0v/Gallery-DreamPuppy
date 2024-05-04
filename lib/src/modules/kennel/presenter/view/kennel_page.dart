import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/utils/constants.dart';
import 'package:gap/gap.dart';

import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';

import '../../data/kennel_datasource.dart';
import '../../domain/entities/kennel_entity.dart';
import '../../domain/usecases/on_credits_tap_usecase.dart';
import '../../domain/usecases/on_redirect_contact_usecase.dart';
import '../../kennel_module.dart';
import '../../presenter/components/social_button.dart';

import 'package:package_info_plus/package_info_plus.dart';

class KennelPage extends StatefulWidget {
  const KennelPage({
    super.key,
    required this.kennelId,
  });

  final dynamic kennelId;
  @override
  State<KennelPage> createState() => _KennelPageState();
}

class _KennelPageState extends State<KennelPage> {
  late Future<KennelDetails> _future;
  @override
  void initState() {
    _future = kennelIoC.get<KennelDatasource>().fetch(widget.kennelId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text('Sobre o Canil'),
          previousPageTitle: 'Detalhes',
          trailing: Tooltip(
            // O google anvisou que está faltando suporte para screen readers para acessibilidade
            message: 'Abrir uma reclamação para com o canil',
            child: IconButton(
                onPressed: () {
                  OnRedirectContactUsecase().launchWhatsapp(
                    context,
                    supportWhatsAppDefaultNumber,
                    'Gostaria de abrir uma reclamação para com o canil ${widget.kennelId}.',
                  );
                },
                icon: Icon(
                  Icons.warning_rounded,
                  color: Colors.yellow.shade700,
                )),
          )),
      child: SafeArea(
        child: FutureBuilder<KennelDetails>(
            future: _future,
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
              } else if (snapshot.hasData && snapshot.data != null) {
                final kennelEntity = snapshot.data as KennelDetails;

                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MaxGap(16),
                    Center(
                      child: Text(
                        kennelEntity.name,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(fontSize: 24),
                      ),
                    ),
                    const Gap(8),
                    Text(
                        'Localizado em ${kennelEntity.city} - ${kennelEntity.uf.toUpperCase()}'),
                    const MaxGap(32),
                    SocialButtonWidget(
                      icon: Assets.icons.icons8Whatsapp48.image(height: 26),
                      text: 'WhatsApp',
                      color: const Color.fromARGB(0xFF, 0x07, 0x5e, 0x54),
                      onPressed: () => OnRedirectContactUsecase().call(
                        context,
                        ContactType.whatsapp,
                        kennelEntity.phone,
                      ),
                    ),
                    const Gap(8),
                    SocialButtonWidget(
                      icon: Assets.icons.icons8Instagram48.image(height: 26),
                      text: 'Instagram',
                      color: const Color.fromARGB(0xFF, 0xbc, 0x2a, 0x8d),
                      onPressed: () => OnRedirectContactUsecase().call(
                        context,
                        ContactType.instagram,
                        kennelEntity.instagram,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FutureBuilder<PackageInfo>(
                            future: PackageInfo.fromPlatform(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                String version = snapshot.data!.version;
                                String buildNumber = snapshot.data!.buildNumber;
                                return Text('Versão $version ($buildNumber)');
                              }
                              return const SizedBox();
                            }),
                        Text('2021-${DateTime.now().year} DreamPuppy Ltda. ®'),
                        RichText(
                          text: TextSpan(
                            text: 'Icons by ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Icons8',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    OnCreditsTapUsecase()
                                        .call('https://icons8.com.br/license');
                                  },
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
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
