/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/air.svg
  String get air => 'assets/icons/air.svg';

  /// File path: assets/icons/ava.svg
  String get ava => 'assets/icons/ava.svg';

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/bell.svg
  String get bell => 'assets/icons/bell.svg';

  /// File path: assets/icons/boat.svg
  String get boat => 'assets/icons/boat.svg';

  /// File path: assets/icons/bookMark.svg
  String get bookMark => 'assets/icons/bookMark.svg';

  /// File path: assets/icons/car.svg
  String get car => 'assets/icons/car.svg';

  /// File path: assets/icons/cloud.svg
  String get cloud => 'assets/icons/cloud.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/left.svg
  String get left => 'assets/icons/left.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/menu.svg
  String get menu => 'assets/icons/menu.svg';

  /// File path: assets/icons/message.svg
  String get message => 'assets/icons/message.svg';

  /// File path: assets/icons/more.svg
  String get more => 'assets/icons/more.svg';

  /// File path: assets/icons/moto.svg
  String get moto => 'assets/icons/moto.svg';

  /// File path: assets/icons/options.svg
  String get options => 'assets/icons/options.svg';

  /// File path: assets/icons/person.svg
  String get person => 'assets/icons/person.svg';

  /// File path: assets/icons/right.svg
  String get right => 'assets/icons/right.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/sun.svg
  String get sun => 'assets/icons/sun.svg';

  /// List of all assets
  List<String> get values => [
        air,
        ava,
        back,
        bell,
        boat,
        bookMark,
        car,
        cloud,
        google,
        left,
        location,
        logo,
        menu,
        message,
        more,
        moto,
        options,
        person,
        right,
        search,
        sun
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesJpegGen get jpeg => const $AssetsImagesJpegGen();
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
}

class $AssetsImagesJpegGen {
  const $AssetsImagesJpegGen();

  /// File path: assets/images/jpeg/Chumphon.jpeg
  AssetGenImage get chumphon =>
      const AssetGenImage('assets/images/jpeg/Chumphon.jpeg');

  /// File path: assets/images/jpeg/DoiInthanon.jpeg
  AssetGenImage get doiInthanon =>
      const AssetGenImage('assets/images/jpeg/DoiInthanon.jpeg');

  /// File path: assets/images/jpeg/DoiPui.jpeg
  AssetGenImage get doiPui =>
      const AssetGenImage('assets/images/jpeg/DoiPui.jpeg');

  /// File path: assets/images/jpeg/GoldenGateBridge.jpeg
  AssetGenImage get goldenGateBridge =>
      const AssetGenImage('assets/images/jpeg/GoldenGateBridge.jpeg');

  /// File path: assets/images/jpeg/Krabi.jpeg
  AssetGenImage get krabi =>
      const AssetGenImage('assets/images/jpeg/Krabi.jpeg');

  /// File path: assets/images/jpeg/Kyoto.jpeg
  AssetGenImage get kyoto =>
      const AssetGenImage('assets/images/jpeg/Kyoto.jpeg');

  /// File path: assets/images/jpeg/PhraNang.jpeg
  AssetGenImage get phraNang =>
      const AssetGenImage('assets/images/jpeg/PhraNang.jpeg');

  /// File path: assets/images/jpeg/Tambon.jpeg
  AssetGenImage get tambon =>
      const AssetGenImage('assets/images/jpeg/Tambon.jpeg');

  /// File path: assets/images/jpeg/Tibidabo.jpeg
  AssetGenImage get tibidabo =>
      const AssetGenImage('assets/images/jpeg/Tibidabo.jpeg');

  /// File path: assets/images/jpeg/splash.jpeg
  AssetGenImage get splash =>
      const AssetGenImage('assets/images/jpeg/splash.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        chumphon,
        doiInthanon,
        doiPui,
        goldenGateBridge,
        krabi,
        kyoto,
        phraNang,
        tambon,
        tibidabo,
        splash
      ];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/onboardingFirst.png
  AssetGenImage get onboardingFirst =>
      const AssetGenImage('assets/images/png/onboardingFirst.png');

  /// File path: assets/images/png/onboardingLast.png
  AssetGenImage get onboardingLast =>
      const AssetGenImage('assets/images/png/onboardingLast.png');

  /// File path: assets/images/png/onboardingSecond.png
  AssetGenImage get onboardingSecond =>
      const AssetGenImage('assets/images/png/onboardingSecond.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [onboardingFirst, onboardingLast, onboardingSecond];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
