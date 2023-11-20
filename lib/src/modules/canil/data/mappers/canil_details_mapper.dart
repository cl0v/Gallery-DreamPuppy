import 'package:gallery/src/modules/canil/domain/entities/canil_details.dart';

class CanilDetailsMapper {
  static CanilDetails map(dynamic json) => CanilDetails(
        name: json['name'],
        address: json['address'],
        contacts: []
      );
}
