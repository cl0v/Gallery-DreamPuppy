class LaunchException implements Exception {
  String message;
  int code;

  LaunchException(
    this.message, {
    required this.code,
  });

  @override
  String toString() {
    return '$message [$code]';
  }
}
