// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DetailsPage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GalleryPage(),
      );
    },
  };
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<void> {
  const DetailsRoute({List<PageRouteInfo>? children})
      : super(
          DetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GalleryPage]
class GalleryRoute extends PageRouteInfo<void> {
  const GalleryRoute({List<PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
