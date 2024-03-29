import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/presenation/common_widgets/backgroud_image.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_appbar.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/vertical_item.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/bloc/favourite_bloc.dart';
import 'package:rick_and_morty/layers/presenation/home/bloc/home_bloc.dart';
import 'package:rick_and_morty/layers/presenation/navigation/cubit/navigation_cubit.dart';

import '../../common_widgets/headers.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>()..add(HomeEvent());

    return Stack(
      children: [
        BackgroudImage(),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black.withOpacity(0.7),
          appBar: CustomAppBar(),
          body: BlocListener<FavouriteBloc, FavouritePageState>(
            bloc: context.read<FavouriteBloc>(),
            listener: (context, state) {
              if (state is FavouriteAdded || state is FavouriteDeted) {
                homeBloc.add(HomeEvent());
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state is HomeLoaded
                    ? ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(
                          UIUtil.kDefaulutPadding(),
                        ),
                        children: <Widget>[
                          UIUtil.verticalSpace(.17.sh),
                          // Favourite Section
                          Headers(
                            buttonName: Strings.buttonName,
                            headerName: Strings.headerNameFav,
                            onTap: () {
                              context
                                  .read<NavigationCubit>()
                                  .updateSelectedIndex(2);
                            },
                          ),
                          UIUtil.verticalSpace(.025.sh),
                          Verticaltem(
                              context: context,
                              charatcters: state.favouriteCaharacter),
                          UIUtil.verticalSpace(.04.sh),
                          // Meet the cast Section
                          Headers(
                            onTap: () {
                              context
                                  .read<NavigationCubit>()
                                  .updateSelectedIndex(1);
                            },
                            buttonName: Strings.buttonName,
                            headerName: Strings.headerNameCast,
                          ),

                          UIUtil.verticalSpace(.025.sh),
                          Verticaltem(
                              context: context, charatcters: state.allCaracter),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
