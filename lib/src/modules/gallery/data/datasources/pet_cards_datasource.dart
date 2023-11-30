import 'dart:convert';
import 'package:gallery/src/http/url.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';
import '../../infra/datasources/pet_cards.dart';

class PetCardsDatasourceImpl implements PetCardsDatasource {
  final Client client;

  PetCardsDatasourceImpl({required this.client});

  @override
  Future<(List<GalleryCardEntity>, GalleryExceptions?)> getPetCards(
    int amount,
  ) async {
    var response = await client.get(
      Uri.parse('$baseUrl/gallery/?amount=$amount'),
    );

    client.close();

    var body = jsonDecode(response.body);
    if (response.statusCode == 200 && body is List && body.isNotEmpty) {
      return (
        body.map<GalleryCardEntity>(GalleryCardEntity.fromJson).toList(),
        null
      );
    }
    return (
      <GalleryCardEntity>[],
      GalleryExceptions(
        messsage: 'Oops! Acabaram os filhotes, volte amanhã.',
        code: 200,
      ),
    );
  }
}
