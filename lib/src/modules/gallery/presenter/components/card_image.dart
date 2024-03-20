import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';

class CardImageWidget extends StatelessWidget {
  const CardImageWidget({
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    required this.radius,
    required this.imageUrl,
  }) : super(key: key);

  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        // memCacheHeight: size.width.ceil() + 10,
        // memCacheWidth: size.width.ceil() + 10,
        height: height,
        width: width,
        placeholder: (_, __) => const Center(
          child: CircularLoadingWidget(),
        ),
        errorWidget: (_, str, err) {
          //TODO: Implementar log de erro quando a imagem não carrega, exemplo de imagem [https://devapigallery.blob.core.windows.net/ae4888a3465944b382b30fa444eff6aa/e8c039d278654a3fa59653dbcf80cb71.jpeg]
          return GestureDetector(
            onTap: () => debugPrint('Deu probleminha: $str $err'),
            child: Container(
              color: Colors.red.shade50,
              child: Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.red.shade300,
              ),
            ),
          );
        },
      ),
    );
  }
}
