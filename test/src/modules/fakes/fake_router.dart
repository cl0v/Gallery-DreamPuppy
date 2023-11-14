import 'package:auto_route/auto_route.dart';
import 'package:gallery/router.dart';

class FakeRouter extends AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DetailsRoute.page, path: '/auth'),
      ];
}