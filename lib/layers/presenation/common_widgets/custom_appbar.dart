import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

final class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        shadowColor: Colors.grey,
        toolbarHeight: .1.sh,
        backgroundColor: Colors.transparent.withOpacity(.4),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.secondaryColor,
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, .1.sh),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 15),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 3),
              ),
            ),
            child: SvgPicture.asset(Assets.images.statusbarlogo,
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().screenHeight > 400 ? .05.sh : 0),
          ),
        ));
  }

  @override
  Size get preferredSize => Size(100, .14.sh);
}
