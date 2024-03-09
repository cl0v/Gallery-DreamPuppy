import 'dart:convert';
import 'package:gallery/src/http/endpoint.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';

abstract class GalleryCardsDatasource {
  /// Fill the gallery with puppy (imgs) cards
  Future<(GalleryInfo?, GalleryExceptions?)> getEntities(int size, int pageNumber);
  dispose();
}

class GalleryInfo {
  final List<GalleryCardEntity> cards;
  final int max;

  GalleryInfo({required this.cards, required this.max});
}

class GalleryCardsDatasourceImpl implements GalleryCardsDatasource {
  final Client client;

  GalleryCardsDatasourceImpl(this.client);

  //TODO: Provavelmente vou precisar deixar nulo a lista, caso algum erro seja lançado
  @override
  Future<(GalleryInfo?, GalleryExceptions?)> getEntities(
    int size,
    int pageNumber,
  ) async {
    var response = await client.get(
      Uri.parse('$baseUrl/gallery?size=$size&page=$pageNumber'),
    );

    var body = jsonDecode(response.body);

    if ((response.statusCode >= 200 && response.statusCode < 300) &&
        body['items'] is List) {
      final info = GalleryInfo(
        cards: (body['items'] as List)
            .map<GalleryCardEntity>(GalleryCardEntity.fromJson)
            .toList(),
        max: body['total'],
      );
      return (info, null);
    }
    return (
      null,
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
