class ServerFetchException implements Exception {
  String message;
  
  ServerFetchException({
    required this.message,
  });
}
