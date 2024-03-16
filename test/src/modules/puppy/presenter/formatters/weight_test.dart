

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/weight.dart';

void main() {
  test('weight ...', () async {
    expect(WeightFormatter.call(1130), '1.130 (g)');
    expect(WeightFormatter.call(2130), '2.130 (g)');
    expect(WeightFormatter.call(32400), '32.400 (g)');
    expect(WeightFormatter.call(3220), '3.220 (g)');
    expect(WeightFormatter.call(null), 'Não informado');
  });
}