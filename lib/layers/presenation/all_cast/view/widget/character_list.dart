import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/gen/colors.gen.dart';
import 'package:rick_and_morty/layers/presenation/all_cast/bloc/cast_bloc.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_cartoon_cart.dart';

final class AllcharacterList extends StatelessWidget {
  const AllcharacterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 15.sp,
            mainAxisSpacing: 15.sp,
          ),
          itemCount: state.characters.length + 1,
          itemBuilder: (context, index) {
            if (index < state.characters.length) {
              return CustomCartoonCart(
                onTap: () {
                  NavigationService.navigateToWithArgs(
                    Routes.details,
                    {
                      "character": state.characters[index],
                    },
                  );
                },
                character: state.characters[index],
              );
            } else {
              if (state.hasReachedEnd) {
                return Center(
                    child: Text(
                  Strings.allCaharacterMessage,
                  style: TextFontStyle.body17SFPro22W600
                      .copyWith(color: AppColors.secondaryColor),
                ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        );
      },
    );
  }
}
