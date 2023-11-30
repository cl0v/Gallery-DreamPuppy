import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';

class VaccinesFormatter {
  ({int amount, String brand}) call(List<Vaccine> vaccines) {
    var amount = vaccines.length;
    var brand = vaccines.last.brand;
    return (amount: amount, brand: brand);
  }
}
