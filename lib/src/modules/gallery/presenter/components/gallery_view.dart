import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      itemCount: cards.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      shrinkWrap: true,
      primary: false,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        if(index == cards.length){
          return const CupertinoActivityIndicator();
        }
        return GestureDetector(
          onTap: () => context.pushNamed(
            'puppy',
            pathParameters: {'id': cards[index].id.toString()},
          ),
          child: Semantics(
            label: 'petCardImg$index',
            child: CardImageWidget(
              imageUrl: cards[index].url,
              radius: 5,
            ),
          ),
        );
      },
    );
  }
}
