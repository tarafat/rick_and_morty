import 'package:flutter/material.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

final class BackgroudImage extends StatelessWidget {
  const BackgroudImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.images.appbg.path,
          ),
          colorFilter: ColorFilter.mode(
            AppColors.bgColor.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
