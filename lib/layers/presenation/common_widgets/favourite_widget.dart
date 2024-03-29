import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/bloc/favourite_bloc.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/cubit/check_favourite_cubit.dart';

import '../../domain/entities/character.dart';

final class FavouriteWidget extends StatelessWidget {
  final Character character;
  const FavouriteWidget({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favouriteCheckCubit = CheckFavouriteCubit();
    final favouriteBloc = context.read<FavouriteBloc>();

    favouriteCheckCubit.showFavouriteCharacterBool(
      character.id!,
    );
    return BlocListener<FavouriteBloc, FavouritePageState>(
      listener: (context, state) {
        if (state is FavouriteAdded || state is FavouriteDeted) {
          favouriteCheckCubit.showFavouriteCharacterBool(character.id!);
          favouriteBloc.add(const FetchAllCharacterEvent());
        }
      },
      child: Positioned(
        top: 5,
        left: 5,
        child: BlocBuilder<CheckFavouriteCubit, CheckFavouriteState>(
          bloc: favouriteCheckCubit,
          builder: (context, fstate) => fstate is FavouriteState
              ? InkWell(
                  onTap: () async {
                    favouriteBloc.add(DeleteFavouriteEvent(character.id!));
                  },
                  child: Image.asset(
                    Assets.images.fovourite.path,
                    height: 30.sp,
                    width: 30.sp,
                  ),
                )
              : InkWell(
                  onTap: () async {
                    favouriteBloc.add(AddFavouriteEvent(character));
                  },
                  child: Image.asset(
                    Assets.images.defautFavourite.path,
                    height: 30.sp,
                    width: 30.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
