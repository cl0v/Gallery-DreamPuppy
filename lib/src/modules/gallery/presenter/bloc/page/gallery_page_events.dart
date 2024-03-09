import '../../../domain/exceptions.dart';

abstract class GalleryPageEvent {}

class SuccessGridGalleryPageEvent implements GalleryPageEvent {}

class ErrorGridGalleryPageEvent extends GalleryExceptions
    implements GalleryPageEvent {
  ErrorGridGalleryPageEvent(super.code, {required super.message});
}

class LoadGridGalleryPageEvent implements GalleryPageEvent {}
