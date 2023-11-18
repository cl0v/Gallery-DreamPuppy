import 'package:auto_route/auto_route.dart';
import 'package:gallery/ioc.dart';
import 'package:gallery/src/modules/auth/presenter/view/login.dart';
import 'src/modules/canil/presenter/view/canil_page.dart';
import 'src/modules/gallery/presenter/view/gallery_page.dart';
import 'src/modules/details/presenter/view/details_page.dart';
import 'widget.dart';

part 'router.gr.dart';

AppRouter get appRouter => getIt.get<AppRouter>();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: GalleryRoute.page, path: '/'), //TODO: Deverá ser a primeira página
        // AutoRoute(page: FirstRoute.page, path: '/'),
        AutoRoute(page: DetailsRoute.page, path: '/details/:id'),
        AutoRoute(page: LoginRoute.page, path: '/auth'),
        // AutoRoute(page: CanilRoute.page, path: '/canil'),
        AutoRoute(page: CanilRoute.page, path: '/'),
      ];
}
