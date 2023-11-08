import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';

class CardImageWidget extends StatelessWidget {
  const CardImageWidget({
    Key? key,
    this.height,
    this.width,
    this.fit,
    required this.radius,
    required this.imageUrl,
  }) : super(key: key);

  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (_, __) => const Center(
          child: CircularLoadingWidget(),
        ),
        errorWidget: (_, __, ___) => const Icon(
          CupertinoIcons.photo,
        ),
      ),
    );
  }
}
