import 'package:gallery/src/modules/puppy/domain/entities/puppy_details_entity.dart';

class VermifugesFormatter {
  ({int amount, String brand}) call(List<Vermifuge> vermifuges) {
    var amount = vermifuges.length;
    var brand = vermifuges.last.brand;
    return (amount: amount, brand: brand);
  }
}
