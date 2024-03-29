import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_cartoon_cart.dart';

final class Verticaltem extends StatelessWidget {
  const Verticaltem({
    super.key,
    required this.context,
    required this.charatcters,
  });

  final BuildContext context;
  final List<Character>? charatcters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:
            ScreenUtil().orientation == Orientation.landscape ? .25.sw : .17.sh,
        width: double.infinity,
        child: charatcters != null && charatcters!.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: charatcters!.length,
                itemBuilder: (context, index) => CustomCartoonCart(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                      Routes.details,
                      {
                        "character": charatcters![index],
                      },
                    );
                  },
                  character: charatcters![index],
                ),
                separatorBuilder: (context, index) =>
                    UIUtil.horizontalSpaceMedium,
              )
            : Center(
                child: Text(
                Strings.NotFound,
                style: TextFontStyle.body15SFPro20W600,
              )));
  }
}
