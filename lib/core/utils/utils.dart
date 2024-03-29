import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

final class Utils {
  // Show SvgImage
  static Widget showSvgPicture(String svg,
          {double? height = 16, double? width = 16}) =>
      SvgPicture.asset(
        height: height,
        width: width,
        svg,
        fit: BoxFit.contain,
      );

  // Show PngImage
  static Widget showPngImage(String imageName,
      {double? height, double? width}) {
    return Image.asset(imageName,
        fit: BoxFit.cover, height: height, width: width);
  }

  static Widget imageSimmerCached(double? height) {
    return SizedBox(
      height: height,
      child: Center(
        child: Lottie.asset(Assets.images.imageShimmer,
            height: height, width: height),
      ),
    );
  }

  static Widget imageNotFound(double? height) {
    return Image.asset(
      Assets.images.errorProduct.path,
      height: height,
      width: height,
    );
  }
}
