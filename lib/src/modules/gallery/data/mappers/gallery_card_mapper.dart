import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';

class GalleryCardMapper {
  static GalleryCardEntity map(dynamic json) => GalleryCardEntity(
        petId: json['id'],
        imageUrl: json['imageUrl'],
      );
}
