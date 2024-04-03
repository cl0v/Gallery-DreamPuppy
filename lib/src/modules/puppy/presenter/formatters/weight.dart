import 'package:flutter/cupertino.dart';

/// Medição em g;
/// Ponto indicando casa dos milhares. 1.350 (g)
/// Icone de pesinho
abstract class WeightFormatter {
  static String call(int? weight, bool isPuppyNull) {
    if(isPuppyNull) return 'Ultimo peso registrado, valor atualizado frequentemente';
    if (weight == null) return 'Não informado';
    var r = splitStringEveryThird(weight.toString()).join('.');
    return '$r (g)';
  }

  @visibleForTesting
  static List<String> splitStringEveryThird(String toSplit) {
    List<String> tmp = List.empty(growable: true);
    int last = toSplit.length;
    for (int i = toSplit.length - 3; i > -3; i -= 3) {
      if (i < 0) i = 0;
      var r = toSplit.substring(i, last);
      tmp.add(r);
      if (i == 0) break;
      last = i;
    }
    return tmp.reversed.toList();
  }
}
