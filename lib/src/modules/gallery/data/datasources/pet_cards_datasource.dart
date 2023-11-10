import 'dart:convert';

import 'package:gallery/src/http/client.dart';
import 'package:gallery/src/modules/gallery/data/mappers/gallery_card_mapper.dart';

import '../../domain/gallery_card_entity.dart';
import '../../infra/datasources/pet_cards.dart';

class PetCardsDatasourceImpl implements PetCardsDatasource {
  final HttpConsumer http;

  PetCardsDatasourceImpl({required this.http});

  @override
  Future<List<GalleryCardEntity>> getPetCards(int amount) async {
    var response = await http.get(
      path: '/gallery',
      query: {"amount": amount.toString()},
    );
    var body = jsonDecode(response.body);
    if (body is List) {
      return body.map<GalleryCardEntity>(GalleryCardMapper.map).toList();
    }
    //TODO: Implementar verificações e possiveis exceptions
    return [];
  }
}
