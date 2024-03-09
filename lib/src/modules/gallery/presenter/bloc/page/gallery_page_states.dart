import 'package:gallery/src/modules/gallery/domain/exceptions.dart';

abstract class GalleryPageState {}

class GalleryPageLoadingState implements GalleryPageState {}

class GalleryPageSuccessState implements GalleryPageState {
  GalleryPageSuccessState();
}

class GalleryPageFailureState extends GalleryExceptions
    implements GalleryPageState {
  GalleryPageFailureState(super.code, {required super.message});
}
