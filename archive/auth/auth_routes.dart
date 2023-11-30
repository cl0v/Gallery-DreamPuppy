import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../../router.dart';
import 'presenter/view/login.dart';

class AuthRouter extends AppRouter {
  static AuthRouter get instance => AuthRouter();

  @override
  List<String> get names => ['login', 'signup'];

  @override
  List<GoRoute> get routes => [
        // Auth Route
        GoRoute(path: '/auth', redirect: (_, __) => '/auth/login'),
        GoRoute(
          name: names[0],
          path: '/auth/login:redirect',
          builder: (context, state) => LoginPage(
              shouldRedirect:
                  bool.parse(state.pathParameters['redirect'] ?? 'false'),
              fromTitle: state.uri.queryParameters['fromTitle'] ?? 'Pet'),
        ),
        GoRoute(
          name: names[1],
          path: '/auth/register:redirect',
          builder: (context, state) => Container(),
          // SigninPage(
          //   shouldRedirect: bool.parse(state.pathParameters['redirect'] ?? 'false'),
          //   fromTitle: state.pathParameters['fromTitle'] ?? 'Pet'
          // ),
        ),
      ];
}
