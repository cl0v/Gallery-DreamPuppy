import '../../../domain/coordinates.dart';
import '../../../domain/exceptions.dart';

abstract class GalleryGridEvent {}

class RequestNewPageGalleryGridEvent implements GalleryGridEvent {}


class FillGalleryGridEvent implements GalleryGridEvent {
  final Function onFinish;
  final Function(GalleryExceptions) onError;
  final GeoCoordinates? coordinates;

  FillGalleryGridEvent({
    /// Geralmente usado para avisar a página gallery que está tudo certo.
    required this.onFinish,
    required this.onError,
    required this.coordinates,
  });
}

class GalleryGridCancelFetchEvent implements GalleryGridEvent {
  const GalleryGridCancelFetchEvent();
}
