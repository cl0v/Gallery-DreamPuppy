import 'dart:convert';

import 'package:http/http.dart';

import 'package:gallery/src/http/url.dart';

import '../domain/entities/kennel_entity.dart';

abstract class KennelDatasource {
  Future<KennelDetails> fetch(int id);
}

class KennelDatasourceImpl implements KennelDatasource {
  final Client client;

  KennelDatasourceImpl(this.client);

  @override
  Future<KennelDetails> fetch(int id) async {
    var response = await client.get(Uri.parse('$baseUrl/kennels/$id'));

    client.close();

    var body = jsonDecode(utf8.decode(response.bodyBytes));

    return KennelDetails.fromJson(body);
  }
}