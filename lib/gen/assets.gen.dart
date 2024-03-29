/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appbg.png
  AssetGenImage get appbg => const AssetGenImage('assets/images/appbg.png');

  /// File path: assets/images/cast.svg
  String get cast => 'assets/images/cast.svg';

  /// File path: assets/images/cast_unselect.svg
  String get castUnselect => 'assets/images/cast_unselect.svg';

  /// File path: assets/images/defautFavourite.png
  AssetGenImage get defautFavourite =>
      const AssetGenImage('assets/images/defautFavourite.png');

  /// File path: assets/images/episodes.svg
  String get episodes => 'assets/images/episodes.svg';

  /// File path: assets/images/episodes_unselect.svg
  String get episodesUnselect => 'assets/images/episodes_unselect.svg';

  /// File path: assets/images/errorProduct.png
  AssetGenImage get errorProduct =>
      const AssetGenImage('assets/images/errorProduct.png');

  /// File path: assets/images/favourite_select.svg
  String get favouriteSelect => 'assets/images/favourite_select.svg';

  /// File path: assets/images/favourite_unselect.svg
  String get favouriteUnselect => 'assets/images/favourite_unselect.svg';

  /// File path: assets/images/fovourite.png
  AssetGenImage get fovourite =>
      const AssetGenImage('assets/images/fovourite.png');

  /// File path: assets/images/gender.svg
  String get gender => 'assets/images/gender.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/home_unselect.svg
  String get homeUnselect => 'assets/images/home_unselect.svg';

  /// File path: assets/images/image_shimmer.json
  String get imageShimmer => 'assets/images/image_shimmer.json';

  /// File path: assets/images/location.svg
  String get location => 'assets/images/location.svg';

  /// File path: assets/images/locations.svg
  String get locations => 'assets/images/locations.svg';

  /// File path: assets/images/locations_unselect.svg
  String get locationsUnselect => 'assets/images/locations_unselect.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo.svg
  String get logoSvg => 'assets/images/logo.svg';

  /// File path: assets/images/origin.svg
  String get origin => 'assets/images/origin.svg';

  /// File path: assets/images/route.svg
  String get route => 'assets/images/route.svg';

  /// File path: assets/images/species.svg
  String get species => 'assets/images/species.svg';

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/status.svg
  String get status => 'assets/images/status.svg';

  /// File path: assets/images/statusbarlogo.svg
  String get statusbarlogo => 'assets/images/statusbarlogo.svg';

  /// List of all assets
  List<dynamic> get values => [
        appbg,
        cast,
        castUnselect,
        defautFavourite,
        episodes,
        episodesUnselect,
        errorProduct,
        favouriteSelect,
        favouriteUnselect,
        fovourite,
        gender,
        home,
        homeUnselect,
        imageShimmer,
        location,
        locations,
        locationsUnselect,
        logoPng,
        logoSvg,
        origin,
        route,
        species,
        splash,
        status,
        statusbarlogo
      ];
}

class Assets {
  Assets._();

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
