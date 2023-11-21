import 'package:flutter/foundation.dart';
import 'package:gallery/src/modules/auth/presenter/view/login.dart';
import 'package:go_router/go_router.dart';
import 'src/modules/canil/presenter/view/canil_page.dart';
import 'src/modules/gallery/presenter/view/gallery_page.dart';
import 'src/modules/details/presenter/view/details_page.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DetailsPage(),
    ),
    GoRoute(
      path: '/canil',
      builder: (context, state) => const CanilPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const CanilPage(),
    ),
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