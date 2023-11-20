import 'dart:convert';

import 'package:gallery/src/http/url.dart';
import 'package:gallery/src/modules/canil/data/mappers/canil_details_mapper.dart';
import 'package:gallery/src/modules/canil/domain/entities/canil_details.dart';
import 'package:http/http.dart';

class FetchCanilDatasource {
  final Client client;

  FetchCanilDatasource(this.client);

  Future<CanilDetails> fetch(String canilId) async {
    var response = await client.get(Uri.parse('$baseUrl/canil'),
      headers: {"canil_id": canilId},
    );

    var body = jsonDecode(response.body);

    return CanilDetailsMapper.map(body);
  }
}
