
abstract class GalleryPageState {}

class GalleryPageLoadingState implements GalleryPageState {}

class GalleryPageSuccessState implements GalleryPageState {
  GalleryPageSuccessState();
}

class GalleryPageFailureState implements GalleryPageState {
  final String message;
  final int code;

  GalleryPageFailureState({
    required this.message,
    required this.code,
  });
}