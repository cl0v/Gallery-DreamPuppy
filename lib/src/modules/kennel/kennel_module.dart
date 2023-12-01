import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:gallery/modules.dart';
import 'package:gallery/ioc.dart';

import 'data/kennel_datasource.dart';

final kennelIoC = GetIt.asNewInstance();

class DefaultKennelModule extends KennelModule {
  DefaultKennelModule() : super(kennelIoC);

  @override
  void init() {
    kennelIoC.registerFactory<KennelDatasource>(
      () => KennelDatasourceImpl(
        appIoC.get<Client>(),
      ),
    );
    super.init();
  }
}
