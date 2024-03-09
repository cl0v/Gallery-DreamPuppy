import 'package:flutter/foundation.dart';

import '../../../domain/exceptions.dart';

abstract class GalleryGridEvent {}

class RequestNewPageGalleryGridEvent implements GalleryGridEvent {}

class FillGalleryGridEvent implements GalleryGridEvent {
  final Function onFinish;
  final Function(GalleryExceptions) onError;

  FillGalleryGridEvent({
    /// Geralmente usado para avisar a página gallery que está tudo certo.
    required this.onFinish,
    required this.onError,
  });
}

class GalleryGridCancelFetchEvent implements GalleryGridEvent {
  const GalleryGridCancelFetchEvent();
}
