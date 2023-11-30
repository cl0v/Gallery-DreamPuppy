import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/design/colors.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';

const borderRadius = Radius.circular(10);

class ImgsCarouselComponent extends StatelessWidget {
  const ImgsCarouselComponent({
    super.key,
    required this.height,
    required this.pictures,
  });

  final double height;
  final List<String> pictures;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView(
        allowImplicitScrolling: true,
        children: pictures
            .map(
              (pic) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: borderRadius,
                  bottomRight: borderRadius,
                ),
                child: CachedNetworkImage(
                  placeholderFadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,
                  fadeInDuration: Duration.zero,
                  errorWidget: (_, __, ___) => Center(
                    child: Icon(
                      CupertinoIcons.exclamationmark_triangle_fill,
                      color: Colors.red.shade300,
                    ),
                  ),
                  placeholder: pic == pictures.first
                      ? (c, _) => Hero(
                            tag: pic,
                            child: CachedNetworkImage(
                                imageUrl: pic,
                                fit: BoxFit.cover,
                                placeholder: (_, __) =>
                                    const ImageLoadingPlaceholder()),
                          )
                      : (_, __) => const ImageLoadingPlaceholder(),
                  imageUrl: pic,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// load de imagem com um fundo bonito e intuitivo
class ImageLoadingPlaceholder extends StatelessWidget {
  const ImageLoadingPlaceholder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: hexGreyBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: borderRadius,
          bottomRight: borderRadius,
        ),
      ),
      child: const Center(
        child: CircularLoadingWidget(),
      ),
    );
  }
}
