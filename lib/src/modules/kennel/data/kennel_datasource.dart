import 'dart:convert';

import 'package:http/http.dart';

import 'package:gallery/src/http/endpoint.dart';

import '../domain/entities/kennel_entity.dart';

abstract class KennelDatasource {
  Future<KennelDetails> fetch(dynamic id);
}

class KennelDatasourceImpl implements KennelDatasource {
  final Client client;

  KennelDatasourceImpl(this.client);

  @override
  Future<KennelDetails> fetch(dynamic id) async {
    var response = await client.get(Uri.parse('$baseUrl/kennels/$id'));

    client.close();

    var body = jsonDecode(utf8.decode(response.bodyBytes));

    return KennelDetails.fromJson(body);
  }
}
