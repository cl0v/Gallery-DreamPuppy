/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimsGen {
  const $AssetsAnimsGen();

  /// File path: assets/anims/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/anims/loading.gif');

  /// File path: assets/anims/loading_small.gif
  AssetGenImage get loadingSmall =>
      const AssetGenImage('assets/anims/loading_small.gif');

  /// List of all assets
  List<AssetGenImage> get values => [loading, loadingSmall];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cpu.png
  AssetGenImage get cpu => const AssetGenImage('assets/icons/cpu.png');

  /// File path: assets/icons/dna_icon.png
  AssetGenImage get dnaIcon => const AssetGenImage('assets/icons/dna_icon.png');

  /// File path: assets/icons/drug_medecine_syringue_icon.png
  AssetGenImage get drugMedecineSyringueIcon =>
      const AssetGenImage('assets/icons/drug_medecine_syringue_icon.png');

  /// File path: assets/icons/icons8-instagram-48.png
  AssetGenImage get icons8Instagram48 =>
      const AssetGenImage('assets/icons/icons8-instagram-48.png');

  /// File path: assets/icons/icons8-whatsapp-48.png
  AssetGenImage get icons8Whatsapp48 =>
      const AssetGenImage('assets/icons/icons8-whatsapp-48.png');

  /// File path: assets/icons/logo512.png
  AssetGenImage get logo512Png =>
      const AssetGenImage('assets/icons/logo512.png');

  /// File path: assets/icons/logo512.svg
  String get logo512Svg => 'assets/icons/logo512.svg';

  /// File path: assets/icons/registered_trademark_icon.png
  AssetGenImage get registeredTrademarkIcon =>
      const AssetGenImage('assets/icons/registered_trademark_icon.png');

  /// File path: assets/icons/weight-icon.svg
  String get weightIcon => 'assets/icons/weight-icon.svg';

  /// List of all assets
  List<dynamic> get values => [
        cpu,
        dnaIcon,
        drugMedecineSyringueIcon,
        icons8Instagram48,
        icons8Whatsapp48,
        logo512Png,
        logo512Svg,
        registeredTrademarkIcon,
        weightIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimsGen anims = $AssetsAnimsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
