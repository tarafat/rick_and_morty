import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/layers/domain/usecases/favourite_character.dart';

part 'check_favourite_state.dart';

class CheckFavouriteCubit extends Cubit<CheckFavouriteState> {
  CheckFavouriteCubit() : super(CheckFavouriteInitial());

  Future<void> showFavouriteCharacterBool(
    String id,
  ) async {
    bool isFavourite = await locator<FavouriteCharcter>().showFavourite(id);
    if (isFavourite) {
      emit(FavouriteState());
    } else {
      emit(FavouriteDefaultState());
    }
  }
}
