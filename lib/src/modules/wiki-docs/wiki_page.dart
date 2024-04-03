import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/modules/puppy/presenter/view/details_body.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../puppy/presenter/view/details_page.dart';

// # details-page-user-guide : Por enquanto se chama assim a rota da página de detalhes puppy-details.page.strings.docs-route
class WikiPage extends StatefulWidget {
  const WikiPage({super.key});

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child:Container()));
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Manual'),
      ),
      //   leading: CupertinoButton(
      //       child: const Text('Voltar'), onPressed: () => context.pop()),
      // ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Manual de informações do filhote, ajuda a garantir a segurança e informações da compra.\n\nLegenda:\n   (1):  Conheça o Canil responsável.',
                  textAlign: TextAlign.start,
                ),
              ),
              Gap(2),
              Divider(),
              Gap(2),
              SizedBox(
                // height: 100,
                child: AbsorbPointer(
                  child: PuppyDetailsBody(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
