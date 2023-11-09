import '../../domain/gallery_card_entity.dart';
import '../datasources/pet_cards.dart';

class GalleryRepositoryImpl {
  PetCardsDatasource datasource;
  GalleryRepositoryImpl({
    required this.datasource,
  });
  Future<List<GalleryCardEntity>> fetchCards(int amount) =>
      datasource.getPetCards(amount);
}
