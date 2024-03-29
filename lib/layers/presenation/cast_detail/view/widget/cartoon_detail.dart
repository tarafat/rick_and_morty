import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

final class CartonDetails extends StatelessWidget {
  const CartonDetails(
      {super.key, this.title, this.subTitle, this.icon, this.subIcon});

  final String? title;
  final String? subTitle;
  final String? icon;
  final String? subIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 12.r),
      height: .25.sw,
      width: .25.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppColors.secondaryColor, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Utils.showSvgPicture('$icon', height: 24.sp, width: 24.sp),
          Text(
            '$title',
            style: TextFontStyle.headline10SFPro18W600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$subTitle',
                style: TextFontStyle.body15SFPro20W600,
              ),
              if (subIcon != null)
                Utils.showSvgPicture('$subIcon', height: 20.sp, width: 20.sp),
            ],
          ),
        ],
      ),
    );
  }
}
