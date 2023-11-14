class RoutesHelper {
  static String endpoint(String path, String params) {
    var op = params.isEmpty ? '' : '?';
    var tmp = '$path$op$params';
    return tmp;
  }
}


class RedirectParams {
  late Map<String, dynamic> _params;
  RedirectParams({
    Map<String, dynamic> params = const {},
  }) {
    _params = params;
  }

  String get params {
    var tmp = '';
    _params.forEach((key, value) {
      tmp += '$key=$value';
    });
    return tmp;
  }
}
