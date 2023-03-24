/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsBannersGen {
  const $AssetsBannersGen();

  /// File path: assets/banners/banner1.jpg
  AssetGenImage get banner1 =>
      const AssetGenImage('assets/banners/banner1.jpg');

  /// File path: assets/banners/banner2.png
  AssetGenImage get banner2 =>
      const AssetGenImage('assets/banners/banner2.png');

  /// File path: assets/banners/banner3.jpg
  AssetGenImage get banner3 =>
      const AssetGenImage('assets/banners/banner3.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [banner1, banner2, banner3];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/account_circle.png
  AssetGenImage get accountCircle =>
      const AssetGenImage('assets/icons/account_circle.png');

  /// File path: assets/icons/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/app_icon.png');

  /// File path: assets/icons/envelope.png
  AssetGenImage get envelope =>
      const AssetGenImage('assets/icons/envelope.png');

  /// File path: assets/icons/envelope_dark.png
  AssetGenImage get envelopeDark =>
      const AssetGenImage('assets/icons/envelope_dark.png');

  /// File path: assets/icons/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/icons/facebook.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/microsoft.png
  AssetGenImage get microsoft =>
      const AssetGenImage('assets/icons/microsoft.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        accountCircle,
        appIcon,
        envelope,
        envelopeDark,
        facebook,
        google,
        microsoft
      ];
}

class $AssetsIllustrationsGen {
  const $AssetsIllustrationsGen();

  /// File path: assets/illustrations/Untitled.svg
  String get untitled => 'assets/illustrations/Untitled.svg';

  /// File path: assets/illustrations/welcome_1.svg
  String get welcome1 => 'assets/illustrations/welcome_1.svg';

  /// List of all assets
  List<String> get values => [untitled, welcome1];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/empty.json
  String get empty => 'assets/lotties/empty.json';

  /// File path: assets/lotties/maintenance.json
  String get maintenance => 'assets/lotties/maintenance.json';

  /// File path: assets/lotties/sent.json
  String get sent => 'assets/lotties/sent.json';

  /// List of all assets
  List<String> get values => [empty, maintenance, sent];
}

class Assets {
  Assets._();

  static const $AssetsBannersGen banners = $AssetsBannersGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationsGen illustrations =
      $AssetsIllustrationsGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
