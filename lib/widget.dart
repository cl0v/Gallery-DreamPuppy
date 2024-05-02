import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/gallery/gallery_module.dart';

import 'ioc.dart';
import 'router.dart';
import 'src/modules/kennel/kennel_module.dart';
import 'src/modules/puppy/puppy_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    appIoC.registerFactory<http.Client>(() => http.Client());
    _registerIoCs();
    _initModules();

    super.initState();
  }

  _registerIoCs() {
    //! TODO: DONT WASTE TIME
    // TODO: Usar o modulo de autenticação ja pronto no arquive
    // appIoC.registerSingleton<AuthModule>(DefaultAuthModule(authIoC));

    appIoC.registerSingleton<GalleryModule>(DefaultGalleryModule());
    appIoC.registerSingleton<PuppyModule>(DefaultPuppyModule());
    appIoC.registerSingleton<KennelModule>(DefaultKennelModule());
  }

  _initModules() {
    appIoC.get<GalleryModule>().init();
    appIoC.get<PuppyModule>().init();
    appIoC.get<KennelModule>().init();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'iPets',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
    );
  }
}
