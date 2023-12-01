import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/gallery/gallery_module.dart';

import 'router.dart';
import 'src/modules/kennel/kennel_module.dart';
import 'src/modules/puppy/puppy_module.dart';

final appIoC = GetIt.asNewInstance();

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    appIoC.registerFactory<Client>(() => Client());
    appIoC.registerSingleton<GalleryModule>(DefaultGalleryModule());
    appIoC.registerSingleton<PuppyModule>(DefaultPuppyModule());
    appIoC.registerSingleton<KennelModule>(DefaultKennelModule());
    appIoC.get<GalleryModule>().init();
    appIoC.get<PuppyModule>().init();
    appIoC.get<KennelModule>().init();
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
      theme: const CupertinoThemeData(),
    );
  }
}
