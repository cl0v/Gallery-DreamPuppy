import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';

abstract class PetCardsDatasource {
  Future<List<GalleryCardEntity>> getPetCards();
}