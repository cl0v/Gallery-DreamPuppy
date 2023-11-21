import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'router.dart';
import 'modules.dart';
import 'package:get_it/get_it.dart';
import 'src/modules/auth/auth_module.dart';

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
    appIoC.registerSingleton<Client>(Client());
    appIoC.get<AuthModule>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'DreamPuppy - Gallery',
      theme: const CupertinoThemeData(
        //todo ALTERAR a cor do tema
        // primaryColor: Color(0xFF000000),
        // primaryColor: Color(0xFFF1B1B3),
        brightness: Brightness.light,
      ),
    );
  }
}