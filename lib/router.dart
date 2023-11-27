import 'package:flutter/foundation.dart';
import 'package:gallery/src/modules/gallery/presenter/view/gallery_page.dart';
import 'package:go_router/go_router.dart';
import 'src/modules/canil/presenter/view/canil_page.dart';
import 'src/modules/puppy/presenter/view/details_page.dart';

abstract class AppRouter {
  List<String> get names => [];
  List<GoRoute> get routes => [];
}

GoRouter appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GalleryPage(),
    ),
    GoRoute(
      name: 'puppy',
      path: '/puppy/:id',
      builder: (context, state) => DetailsPage(
        petId: int.tryParse(state.pathParameters['id'] as String) ?? 0,
      ),
    ),
    GoRoute(
      name: 'canil',
      path: '/canil',
      builder: (context, state) => CanilPage(
        canilId:
            int.tryParse(state.uri.queryParameters['canilId'].toString()) ?? 0,
      ),
    ),
    // ...AuthRouter.instance.routes,
  ],
);




/*

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DetailsRoute.page, path: '/'),
        // AutoRoute(page: GalleryRoute.page, path: '/'), //TODO: Gallery Deverá ser a primeira página
        AutoRoute(page: GalleryRoute.page, path: '/g'),
        // AutoRoute(page: DetailsRoute.page, path: '/details/:id'),
        AutoRoute(page: LoginRoute.page, path: '/auth'),
        AutoRoute(
          page: CanilRoute.page, /*path: '/canil'*/
        ),
      ];
}
*/