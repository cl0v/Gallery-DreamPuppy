import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/puppy/data/puppy_datasource.dart';
import 'package:gallery/ioc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final puppyIoC = GetIt.asNewInstance();

class DefaultPuppyModule extends PuppyModule {
  DefaultPuppyModule() : super(puppyIoC);

  @override
  init() {
    puppyIoC.registerFactory<PuppyDetailsDatasource>(
      () => PuppyDetailsDatasourceImpl(
        appIoC.get<Client>(),
      ),
    );
    super.init();
  }
}
