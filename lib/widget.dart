import 'package:flutter/cupertino.dart';
import 'router.dart';
import 'main.dart';
import 'modules.dart';
import 'package:get_it/get_it.dart';
import 'src/modules/auth/module.dart';
import 'src/modules/gallery/presenter/view/gallery_page.dart';
import 'package:auto_route/auto_route.dart';

final appIoC = GetIt.asNewInstance();

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    // Start loading important things.
    appIoC.registerSingleton<AuthModule>(DefaultAuthModule(authIoC));
    appIoC.get<AuthModule>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: getIt<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
      title: 'DreamPuppy - Gallery',
      theme: const CupertinoThemeData(
        //todo ALTERAR a cor do tema
        primaryColor: Color(0xF1B1B3FF),
        // primaryColor: Color(0xFFF1B1B3),
        brightness: Brightness.light,
      ),
    );
  }
}
