import 'package:gallery/src/http/url.dart';
import 'package:http/http.dart' as http;


//TODO: Alterar as chamadas http para https [https://fastapi.tiangolo.com/deployment/https/?h=https]
abstract class HttpConsumer {
  Future<http.Response> get({
    String? url = baseUrl,
    required String path,
    Map<String, String>? query,
  });
  // put();
  // post();
}

class DefaultHttpConsumer implements HttpConsumer {
  DefaultHttpConsumer();

  @override
  Future<http.Response> get({
    String? url = baseUrl,
    required String path,
    Map<String, dynamic>? query,
  }) {
    var url = Uri.http(baseUrl, path, query);
    return http.get(url);
  }
}
