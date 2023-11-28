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
    var l = [
      "https://devapigallery.blob.core.windows.net/cc5c276fa4f14adfb6392c9e52dcc4b3/07c1e718fd2f4995a3d91e7478f9838d.jpeg",
      "https://devapigallery.blob.core.windows.net/fc424cb08670490fa5d7c698a4aacef0/d457a9e840df4a0fb7a913a98bca52c8.jpeg",
      "https://devapigallery.blob.core.windows.net/da6f39e9103c4ceaacc04e25cd12d2fb/209a4b96eb0649c8a9c224035b99b659.jpeg",
      "https://devapigallery.blob.core.windows.net/ae4888a3465944b382b30fa444eff6aa/e8c039d278654a3fa59653dbcf80cb71.jpeg"
    ];
    return List.generate(l.length,
        (index) => GalleryCardEntity(petId: index, imageUrl: l[index]));
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
