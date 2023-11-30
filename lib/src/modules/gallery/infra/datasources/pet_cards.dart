import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';

import '../../domain/exceptions.dart';

abstract class PetCardsDatasource {
  Future<(List<GalleryCardEntity>, GalleryExceptions?)>  getPetCards(int amount);
}