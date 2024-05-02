import 'package:gallery/ioc.dart';
import 'package:gallery/modules.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final galleryIoC = GetIt.asNewInstance();

class DefaultGalleryModule extends GalleryModule {
  DefaultGalleryModule() : super(galleryIoC);

  @override
  init() {
    galleryIoC.registerFactory<GalleryCardsDatasource>(
      () => GalleryCardsDatasourceImpl(
        appIoC.get<Client>(),
      ),
    );
    super.init();
  }


}
