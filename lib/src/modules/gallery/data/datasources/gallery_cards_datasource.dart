import 'dart:convert';
import 'package:gallery/src/http/url.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';

abstract class GalleryCardsDatasource {
  /// Fill the gallery with puppy (imgs) cards
  Future<(List<GalleryCardEntity>, GalleryExceptions?)> get(int amount);
}

class GalleryCardsDatasourceImpl implements GalleryCardsDatasource {
  final Client client;

  GalleryCardsDatasourceImpl(this.client);

  //TODO: Provavelmente vou precisar deixar nulo a lista, caso algum erro seja lançado
  @override
  Future<(List<GalleryCardEntity>, GalleryExceptions?)> get(
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
    //TODO: Testar como se comporta quando está rolando até acabar (Antes tinha vários)
    return (
      <GalleryCardEntity>[],
      GalleryExceptions(
        messsage: 'Oops! Acabaram os filhotes, volte amanhã.',
        code: 200,
      ),
    );
  }
}
