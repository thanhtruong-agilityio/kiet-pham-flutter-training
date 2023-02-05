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

  /// File path: assets/icons/brand.svg
  String get brand => 'assets/icons/brand.svg';

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
        brand,
        car,
        cloud,
        google,
        left,
        location,
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

  /// File path: assets/images/canyon.png
  AssetGenImage get canyon => const AssetGenImage('assets/images/canyon.png');

  /// File path: assets/images/chumphon.png
  AssetGenImage get chumphon =>
      const AssetGenImage('assets/images/chumphon.png');

  /// File path: assets/images/doipui.png
  AssetGenImage get doipui => const AssetGenImage('assets/images/doipui.png');

  /// File path: assets/images/krabi.png
  AssetGenImage get krabi => const AssetGenImage('assets/images/krabi.png');

  /// File path: assets/images/kyoto.png
  AssetGenImage get kyoto => const AssetGenImage('assets/images/kyoto.png');

  /// File path: assets/images/onboardingfirst.png
  AssetGenImage get onboardingfirst =>
      const AssetGenImage('assets/images/onboardingfirst.png');

  /// File path: assets/images/onboardinglast.png
  AssetGenImage get onboardinglast =>
      const AssetGenImage('assets/images/onboardinglast.png');

  /// File path: assets/images/onboardingsecond.png
  AssetGenImage get onboardingsecond =>
      const AssetGenImage('assets/images/onboardingsecond.png');

  /// File path: assets/images/phranang.png
  AssetGenImage get phranang =>
      const AssetGenImage('assets/images/phranang.png');

  /// File path: assets/images/splashscreen.png
  AssetGenImage get splashscreen =>
      const AssetGenImage('assets/images/splashscreen.png');

  /// File path: assets/images/tambon.png
  AssetGenImage get tambon => const AssetGenImage('assets/images/tambon.png');

  /// File path: assets/images/tibidabo.png
  AssetGenImage get tibidabo =>
      const AssetGenImage('assets/images/tibidabo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        canyon,
        chumphon,
        doipui,
        krabi,
        kyoto,
        onboardingfirst,
        onboardinglast,
        onboardingsecond,
        phranang,
        splashscreen,
        tambon,
        tibidabo
      ];
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
