import 'package:auto_route/auto_route.dart';
import 'package:gallery/ioc.dart';

import 'src/modules/gallery/presenter/view/gallery_page.dart';
import 'src/modules/details/presenter/view/details_page.dart';

part 'router.gr.dart';

AppRouter get appRouter => getIt.get<AppRouter>();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')   
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GalleryRoute.page, path: '/'),
    AutoRoute(page: DetailsRoute.page, path: '/details/:id'),
  ];
}
