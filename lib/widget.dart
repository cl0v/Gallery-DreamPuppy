import 'package:flutter/cupertino.dart';
import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/gallery/gallery_module.dart';
import 'package:http/http.dart';
import 'router.dart';
import 'package:get_it/get_it.dart';

final appIoC = GetIt.asNewInstance();

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    appIoC.registerSingleton<Client>(Client());
    appIoC.registerSingleton<GalleryModule>(DefaultGalleryModule());
    appIoC.get<GalleryModule>().init();
    //! TODO: DONT WASTE TIME
    // TODO: Usar o modulo de autenticação ja pronto no arquive
    // appIoC.registerSingleton<AuthModule>(DefaultAuthModule(authIoC));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'DreamPuppy - Galeria de Filhotes',
      theme: const CupertinoThemeData(
          //todo ALTERAR a cor do tema
          // primaryColor: Color(0xFF000000),
          // primaryColor: Color(0xFFF1B1B3),
          // brightness: Brightness.light,
          ),
    );
  }
}
