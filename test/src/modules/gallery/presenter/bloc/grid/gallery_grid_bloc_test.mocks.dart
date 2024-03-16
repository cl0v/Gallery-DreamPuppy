// Mocks generated by Mockito 5.4.4 from annotations
// in gallery/test/src/modules/gallery/presenter/bloc/grid/gallery_grid_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart'
    as _i2;
import 'package:gallery/src/modules/gallery/domain/exceptions.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GalleryCardsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGalleryCardsDatasource extends _i1.Mock
    implements _i2.GalleryCardsDatasource {
  @override
  _i3.Future<(_i2.GalleryInfo?, _i4.GalleryExceptions?)> getEntities(
    int? size,
    int? pageNumber,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEntities,
          [
            size,
            pageNumber,
          ],
        ),
        returnValue:
            _i3.Future<(_i2.GalleryInfo?, _i4.GalleryExceptions?)>.value(
                (null, null)),
        returnValueForMissingStub:
            _i3.Future<(_i2.GalleryInfo?, _i4.GalleryExceptions?)>.value(
                (null, null)),
      ) as _i3.Future<(_i2.GalleryInfo?, _i4.GalleryExceptions?)>);
}
