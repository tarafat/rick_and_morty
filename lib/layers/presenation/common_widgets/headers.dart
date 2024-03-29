import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

final class Headers extends StatelessWidget {
  const Headers(
      {super.key,
      this.buttonName,
      this.onTap,
      required this.headerName,
      this.headerFontSize = 17,
      this.headerColor});

  final String? buttonName;
  final VoidCallback? onTap;
  final String headerName;
  final Color? headerColor;
  final double headerFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: TextFontStyle.body17SFPro22W600
              .copyWith(color: AppColors.secondaryColor),
        ),
        if (buttonName != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: .035.sh,
              width: .15.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.primaryColor,
              ),
              child: Text(
                '$buttonName',
                style: TextFontStyle.headline10SFPro18W600.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
