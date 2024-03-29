import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';

import 'package:rick_and_morty/layers/presenation/all_cast/cast.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/favourite_cast.dart';
import 'package:rick_and_morty/layers/presenation/home/home.dart';

import 'package:rick_and_morty/layers/presenation/navigation/cubit/navigation_cubit.dart';

final class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2), // Shadow color
                  spreadRadius: 0.5, // Spread radius
                  blurRadius: 1, // Blur radius
                  offset: const Offset(0, -1), // Shadow offset
                ),
              ],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: state == 0
                        ? Utils.showSvgPicture(
                            Assets.images.home,
                            height: 20.r,
                            width: 20.r,
                          )
                        : Utils.showSvgPicture(
                            Assets.images.homeUnselect,
                            height: 20.r,
                            width: 20.r,
                          ),
                    label: Strings.labelHome,
                  ),
                  BottomNavigationBarItem(
                    icon: state == 1
                        ? Utils.showSvgPicture(
                            Assets.images.cast,
                            height: 20.r,
                            width: 20.r,
                          )
                        : Utils.showSvgPicture(
                            Assets.images.castUnselect,
                            height: 20.r,
                            width: 20.r,
                          ),
                    label: Strings.labelCast,
                  ),
                  BottomNavigationBarItem(
                    icon: state == 2
                        ? Utils.showSvgPicture(
                            Assets.images.favouriteSelect,
                            height: 20.r,
                            width: 20.r,
                          )
                        : Utils.showSvgPicture(
                            Assets.images.favouriteUnselect,
                            height: 20.r,
                            width: 20.r,
                          ),
                    label: Strings.labelFavourite,
                  ),
                ],
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.grayColor,
                backgroundColor: AppColors.blackColor,
                useLegacyColorScheme: false,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: state,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  context.read<NavigationCubit>().updateSelectedIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const AllCharacterPage(),
    const FavouriteCharacter(),
  ];
}
