import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

import 'package:rick_and_morty/layers/presenation/common_widgets/backgroud_image.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_appbar.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/headers.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/view/widget/favourite_list.dart';

final class FavouriteCharacter extends StatelessWidget {
  const FavouriteCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavouritesScreen();
  }
}

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroudImage(),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black.withOpacity(0.7),
          appBar: CustomAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: ListView(
              children: <Widget>[
                UIUtil.verticalSpace(.03.sh),
                const Headers(
                    headerName: Strings.headerNameAllFav,
                    headerColor: AppColors.secondaryColor,
                    headerFontSize: 22),
                UIUtil.verticalSpaceMedium,
                //all favourite
                const FavouriteList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
