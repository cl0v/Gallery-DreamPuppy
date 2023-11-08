import 'package:flutter/cupertino.dart';
import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';

import 'card_image.dart';

class GalleryViewComponent extends StatelessWidget {
  const GalleryViewComponent({
    super.key,
    required this.cards,
  });

  final List<GalleryCardEntity> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      itemCount: 29,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => print('Imagem de cachorro $index'),
          child: CardImageWidget(
            imageUrl: cards[index].imageUrl,
            radius: 5,
          ),
        );
      },
    );
  }
}
