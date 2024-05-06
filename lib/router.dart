import 'package:flutter/foundation.dart';
import 'package:gallery/src/modules/gallery/presenter/view/gallery_page.dart';
import 'package:gallery/src/modules/wiki-docs/wiki_page.dart';
import 'package:gallery/src/utils/url_uuid_extractor.dart';
import 'package:go_router/go_router.dart';
import 'src/modules/kennel/presenter/view/kennel_page.dart';
import 'src/modules/puppy/presenter/view/details_page.dart';

GoRouter appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      // redirect: (_, __) => '/docs',
      builder: (context, state) => const GalleryPage(),
      routes: [
        GoRoute(
          name: 'filhotes',
          path: 'filhotes/:id',
          builder: (context, state) => DetailsPage(
            petUuid: extractUuidFromPath(state.pathParameters['id'] as String),
          ),
        ),
        GoRoute(
          name: 'kennel',
          path: 'kennel/:id',
          builder: (context, state) => KennelPage(
            kennelId: int.tryParse(state.pathParameters['id'] as String) ?? 0,
          ),
        ),
        GoRoute(
            name: 'wiki',
            path: 'docs', // Ou docs/
            builder: (c, s) => const WikiPage()
            // redirect: , # Para o /docs/page/details-page-user-guide
            )
      ],
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