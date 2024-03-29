import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/gen/colors.gen.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/favourite_widget.dart';

final class CustomCartoonCart extends StatelessWidget {
  const CustomCartoonCart({required this.character, super.key, this.onTap});

  final Character character;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipPath(
        clipper: BottomLeftClipper(),
        child: Container(
          width: 150.w,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.bgColor.withOpacity(.3),
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
              ),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CachedNetworkImage(
                        width: 190.w,
                        fit: BoxFit.cover,
                        imageUrl: character.image!,
                        placeholder: (context, url) => Utils.imageSimmerCached(
                          .1.sh,
                        ),
                        errorWidget: (context, url, error) =>
                            Utils.imageNotFound(
                          .1.sh,
                        ),
                      ),
                    ),
                    UIUtil.verticalSpaceSmall,
                    Container(
                      child: Text(
                        character.name ?? '',
                        style: TextFontStyle.headline10SFPro18W600
                            .copyWith(overflow: TextOverflow.fade),
                      ),
                    ),
                  ],
                ),
              ),
              FavouriteWidget(
                character: character,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapedContainer extends StatelessWidget {
  const CustomShapedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: CustomPaint(
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20) // Move to the starting point
      ..lineTo(0, size.height) // Draw vertical line
      ..lineTo(size.width, size.height) // Draw horizontal line
      ..lineTo(size.width, 0) // Draw vertical line
      ..close(); // Close the path to form a shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.82, size.height);
    path.lineTo(size.width * 1.50, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
