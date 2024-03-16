import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/gen/assets.gen.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();
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
