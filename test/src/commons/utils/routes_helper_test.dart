import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/commons/utils/routes_helper.dart';

void main() {
  group('endpoint', () {
    test('', () {
      expect(RoutesHelper.endpoint('path', ''), 'path');
      expect(RoutesHelper.endpoint('path', 'val=true'), 'path?val=true');
    });
  });
}
