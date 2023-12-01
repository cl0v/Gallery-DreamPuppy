import 'package:gallery/src/modules/puppy/domain/exceptions.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:gallery/src/http/url.dart';
import '../domain/entities/pet_details.dart';

abstract class PuppyDetailsDatasource {
  Future<(PuppyDetailsEntity?, PuppyDetailsException?)> getDetails(int id);

  Future<(String?, TalkToKennelBtnException?)> getKennelId(int id);
}

class PuppyDetailsDatasourceImpl implements PuppyDetailsDatasource {
  final Client client;

  PuppyDetailsDatasourceImpl(
    this.client,
  );

  @override
  Future<(PuppyDetailsEntity?, PuppyDetailsException?)> getDetails(
      int id) async {
    var response = await client.get(Uri.parse('$baseUrl/puppies/$id'));

    client.close();

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var puppy = PuppyDetailsEntity.fromJson(body);
      return (puppy, null);
    }

    return (
      null,
      PuppyDetailsException(code: response.statusCode, messsage: 'Hmm...')
    );
  }

  @override
  Future<(String?, TalkToKennelBtnException?)> getKennelId(int id) async {
    var response = await client.get(Uri.parse('$baseUrl/puppies/$id/kennel'));
    if (response.statusCode == 200) {
      return (response.body, null);
    }
    return (
      null,
      TalkToKennelBtnException(code: response.statusCode, messsage: 'Hmm...')
    );
  }
}
