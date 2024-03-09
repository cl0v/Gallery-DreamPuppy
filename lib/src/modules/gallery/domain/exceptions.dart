class GalleryExceptions implements Exception {
  int code;
  String message;

  GalleryExceptions(
    this.code, {
    required this.message,
  });

  @override
  toString() => '[$code] $message';
}
