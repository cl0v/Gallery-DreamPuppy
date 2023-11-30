import 'package:gallery/src/modules/puppy/domain/exceptions.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:gallery/src/http/url.dart';
import '../domain/entities/pet_details.dart';

class PuppyDetailsDatasource {
  final Client client;

  PuppyDetailsDatasource(
    this.client,
  );

  Future<(PuppyDetailsEntity?, PuppyDetailsException?)> get(int id) async {
    var response = await client.get(Uri.parse('$baseUrl/puppies/$id'));
    
    client.close();

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return (PuppyDetailsEntity.fromJson(body), null);
    }

    return (
      null,
      PuppyDetailsException(code: response.statusCode, messsage: 'Hmm...')
    );
  }
}
