import 'package:gallery/src/modules/canil/data/datasources/fetch_canil.dart';

import '../../domain/entities/canil_details.dart';

class CanilRepository {
  final FetchCanilDatasource datasource;

  CanilRepository(this.datasource);

  Future<CanilDetails> fetch(String canilId) => datasource.fetch(canilId);
}
