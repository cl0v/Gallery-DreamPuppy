import 'package:flutter/cupertino.dart';
import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';
import 'package:go_router/go_router.dart';

import 'card_image.dart';

class GalleryViewComponent extends StatelessWidget {
  const GalleryViewComponent({
    super.key,
    required this.cards,
    required this.scrollController,
  });

  final List<GalleryCardEntity> cards;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      primary: false,
      itemCount: cards.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          // onTap: () => Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     settings: CupertinoPage(child: DetailsPage(petId: index), name: 'Pet'),
          //     title: 'Pet',
          //     builder: (context) => DetailsPage(petId: index),
          //   ),
          // ),
          onTap: () => context.pushNamed(
            'puppy',
            pathParameters: {'id': '$index'},
          ),
          child: Semantics(
            label: 'petCardImg$index',
            child: CardImageWidget(
              imageUrl: cards[index].imageUrl,
              radius: 5,
            ),
          ),
        );
      },
    );
  }
}
