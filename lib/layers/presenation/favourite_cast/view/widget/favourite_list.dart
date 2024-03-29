import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/presenation/common_widgets/custom_cartoon_cart.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/bloc/favourite_bloc.dart';

final class FavouriteList extends StatefulWidget {
  const FavouriteList({
    super.key,
  });

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  FavouriteBloc get favouriteBloc => context.read<FavouriteBloc>();
  @override
  void initState() {
    super.initState();
    favouriteBloc.add(FetchAllCharacterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouritePageState>(
        builder: (context, state) {
      return state is FavouriteLoaded
          ? state.characters.length == 0
              ? Container(
                  height: .5.sh,
                  width: 1.sw,
                  child: Center(
                    child: Text(
                      Strings.favouriteNotFound,
                      style: TextFontStyle.body15SFPro20W400,
                    ),
                  ),
                )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 15.sp,
                    mainAxisSpacing: 15.sp,
                  ),
                  itemCount: state.characters.length,
                  itemBuilder: (context, index) {
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
                  },
                )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
