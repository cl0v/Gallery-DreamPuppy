import '../domain/gallery_card_entity.dart';
import '../infra/datasources/pet_cards.dart';

class PetCardsDatasourceImpl implements PetCardsDatasource {
  @override
  Future<List<GalleryCardEntity>> getPetCards() async {
    return [
      GalleryCardEntity(
        petId: '1',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
      GalleryCardEntity(
        petId: '3',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
      GalleryCardEntity(
        petId: '4',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
      GalleryCardEntity(
        petId: '5',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
      GalleryCardEntity(
        petId: '6',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
      GalleryCardEntity(
        petId: '7',
        imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
      ),
    ];
  }
}
