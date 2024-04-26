import 'package:http/http.dart';
import 'dart:convert';
import 'package:gallery/src/http/endpoint.dart';
import '../domain/entities/puppy_details_entity.dart';

abstract class PuppyDetailsDatasource {

  Future<PuppyDetailsEntity> getEntity(int id);
  Future<PuppyDetailsEntity> getEntityByUuid(String uuid);
  
  //TODO: Implementar chamada por uuid para poder liberar compartilhamento.
  // Future<PuppyDetailsEntity> getEntityFromUUID(String uuid);

  Future<String> getKennelId(int id);
}

class PuppyDetailsDatasourceImpl implements PuppyDetailsDatasource {
  final Client client;

  PuppyDetailsDatasourceImpl(
    this.client,
  );


  @override
  Future<PuppyDetailsEntity> getEntity(int id) async {
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
  
  @override
  Future<PuppyDetailsEntity> getEntityByUuid(String uuid) async{
    var response = await client.get(Uri.parse('$baseUrl/puppies/$uuid'));

    client.close();

    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return PuppyDetailsEntity.fromJson(body);
  }
}
