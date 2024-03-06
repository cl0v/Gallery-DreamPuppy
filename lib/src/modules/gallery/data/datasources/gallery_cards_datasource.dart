import 'dart:convert';
import 'package:gallery/src/http/endpoint.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';

abstract class GalleryCardsDatasource {
  /// Fill the gallery with puppy (imgs) cards
  Future<(List<GalleryCardEntity>, GalleryExceptions?)> getEntities(int amount);
  dispose();
}

class GalleryCardsDatasourceImpl implements GalleryCardsDatasource {
  final Client client;

  GalleryCardsDatasourceImpl(this.client);

  //TODO: Provavelmente vou precisar deixar nulo a lista, caso algum erro seja lançado
  @override
  Future<(List<GalleryCardEntity>, GalleryExceptions?)> getEntities(
    int pageNumber,
  ) async {
    var response = await client.get(
      Uri.parse('$baseUrl/gallery/?size=3&page=$pageNumber'),
    );

    var body = jsonDecode(response.body);

    if ((response.statusCode >= 200 && response.statusCode < 300) &&
        body['items'] is List) {
      return (
        (body['items'] as List)
            .map<GalleryCardEntity>(GalleryCardEntity.fromJson)
            .toList(),
        null
      );
    }
    //TODO: Verificar se a página é algo diferente da primeira página, caso seja a primeira, pode exibir o acabaram....
      return (
        <GalleryCardEntity>[],
        GalleryExceptions(
          messsage: 'Oops! Acabaram os filhotes, volte amanhã.',
          code: 200,
        ),
      );
    
  }

  @override
  dispose() {
    client.close();
  }
}
