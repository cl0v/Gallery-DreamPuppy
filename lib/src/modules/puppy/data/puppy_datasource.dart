import 'package:http/http.dart';
import 'dart:convert';
import 'package:gallery/src/http/endpoint.dart';
import '../domain/entities/pet_details.dart';

abstract class PuppyDetailsDatasource {
  Future<PuppyDetailsEntity> getEntity(int id);

  Future<String> getKennelId(int id);
}

class PuppyDetailsDatasourceImpl implements PuppyDetailsDatasource {
  final Client client;

  PuppyDetailsDatasourceImpl(
    this.client,
  );

  @override
  Future<PuppyDetailsEntity> getEntity(int id) async {
    //TODO: Esta chamando novamente
    var response = await client.get(Uri.parse('$baseUrl/puppies/$id'));

    client.close();

    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return PuppyDetailsEntity.fromJson(body);
  }

  @override
  Future<String> getKennelId(int id) async {
    var response = await client.get(Uri.parse('$baseUrl/puppies/$id/kennel'));

    client.close();

    return response.body;
  }
}
