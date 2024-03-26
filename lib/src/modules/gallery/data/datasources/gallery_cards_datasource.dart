import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:gallery/src/http/endpoint.dart';
import 'package:gallery/src/modules/gallery/domain/coordinates.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:http/http.dart';
import '../../domain/gallery_card_entity.dart';

abstract class GalleryCardsDatasource {
  /// Fill the gallery with puppy (imgs) cards
  Future<(GalleryInfo?, GalleryExceptions?)> getEntities(
    int size,
    int pageNumber,
    GeoCoordinates? coordinates,
  );
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

  @override
  Future<(GalleryInfo?, GalleryExceptions?)> getEntities(
    int size,
    int pageNumber,
    GeoCoordinates? coordinates,
  ) async {
    late Response response;
    Map<String, String>? headers;
    if (coordinates != null) {
      headers = {
        "lat": coordinates.latitude.toString(),
        "lon": coordinates.longitude.toString(),
      };
    }
    try {
      response = await client.get(
        Uri.parse(
          '$baseUrl/gallery?size=$size&page=$pageNumber',
        ),
        headers: headers,
      );
    } on SocketException catch (err) {
      debugPrint('$err');
      return (
        null,
        GalleryExceptions(
          null,
          message:
              'Problemas com a internet. Verifique a conexão e tente novamente!',
        )
      );
    }

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
        200,
        message: 'Oops! Acabaram os filhotes, volte amanhã.',
      ),
    );
  }

  @override
  dispose() {
    client.close();
  }
}
