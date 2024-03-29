import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/usecases/favourite_character.dart';
import 'package:rick_and_morty/layers/domain/usecases/get_all_characters.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(
      loadinitailData,
    );
  }

  FutureOr<void> loadinitailData(
      HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final allCaharacter = await locator<GetAllCharacters>().call(page: 1);
      List<Character> _chacters = allCaharacter.$1;
      List<Character> caharacter = [];
      if (_chacters.length >= 5) {
        allCaharacter.$1.getRange(0, 5).forEach((element) {
          caharacter.add(element);
        });
      } else {
        caharacter = _chacters;
      }
      List<Character> favcaharacter = [];
      final List<Character> favouriteList =
          await locator<FavouriteCharcter>().getFavouriteList();

      if (favouriteList.length >= 5) {
        favouriteList.getRange(0, 5).forEach((element) {
          favcaharacter.add(element);
        });
      } else {
        favcaharacter = favouriteList;
      }
      emit(HomeLoaded(
          allCaracter: caharacter, favouriteCaharacter: favcaharacter));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
