import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/usecases/favourite_character.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouritePageState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FetchAllCharacterEvent>(
      fetchFavouriteData,
    );
    on<DeleteFavouriteEvent>(
      removeFavourite,
    );
    on<AddFavouriteEvent>(
      addFavourite,
    );
  }

  Future<void> fetchFavouriteData(
      event, Emitter<FavouritePageState> emit) async {
    emit(FavouriteLoading());

    try {
      final List<Character> favouriteList =
          await locator<FavouriteCharcter>().getFavouriteList();

      emit(FavouriteLoaded(characters: favouriteList));
    } catch (e) {
      emit(FavouriteError());
    }
  }

  FutureOr<void> removeFavourite(
      DeleteFavouriteEvent event, Emitter<FavouritePageState> emit) async {
    emit(FavouriteLoading());

    try {
      await locator<FavouriteCharcter>().removeFavourite(event.id);
      // final List<Character> favouriteList =
      //     await locator<FavouriteCharcter>().getFavouriteList();

      emit(FavouriteDeted());
    } catch (e) {
      emit(FavouriteError());
    }
  }

  FutureOr<void> addFavourite(
      AddFavouriteEvent event, Emitter<FavouritePageState> emit) async {
    emit(FavouriteLoading());

    try {
      await locator<FavouriteCharcter>().addFavourite(event.character);
      // final List<Character> favouriteList =
      //     await locator<FavouriteCharcter>().getFavouriteList();

      emit(FavouriteAdded());
    } catch (e) {
      emit(FavouriteError());
    }
  }
}
