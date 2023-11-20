import 'dart:convert';
import 'package:gallery/src/http/url.dart';
import 'package:gallery/src/modules/gallery/data/mappers/gallery_card_mapper.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';
import '../../infra/datasources/pet_cards.dart';

class PetCardsDatasourceImpl implements PetCardsDatasource {
  final Client client;

  PetCardsDatasourceImpl({required this.client});

  @override
  Future<List<GalleryCardEntity>> getPetCards(int amount) async {
    var response = await client.get(
      Uri.parse('$baseUrl/gallery'),
      headers: {"amount": amount.toString()},
    );
    var body = jsonDecode(response.body);
    if (body is List) {
      return body.map<GalleryCardEntity>(GalleryCardMapper.map).toList();
    }
    //TODO: Implementar verificações e possiveis exceptions
    return [];
  }
}
