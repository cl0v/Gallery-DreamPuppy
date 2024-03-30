import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gallery/gen/assets.gen.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
    // return Platform.isIOS
    //     ? const CupertinoActivityIndicator()
    //     : const CircularProgressIndicator();
  }
}

class ImagePlaceholderLoadingWidget extends StatelessWidget {
  const ImagePlaceholderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator()
        : Assets.anims.loadingSmall.image();
  }
}

class OnlyGifPlaceholderLoadingWidget extends StatelessWidget {
  const OnlyGifPlaceholderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.anims.loadingSmall.image(fit: BoxFit.contain);
  }
}
