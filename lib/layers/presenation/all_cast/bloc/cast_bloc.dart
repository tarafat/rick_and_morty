import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/usecases/get_all_characters.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastState()) {
    on<FetchNextEvent>(
      fetchNext,
    );
    on<SearchEvent>(
      searchCharacter,
    );
  }

  Future<void> fetchNext(event, Emitter<CastState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: ChastPageStatus.loading));

    final list =
        await locator<GetAllCharacters>().call(page: state.currentPage);

    emit(
      state.copyWith(
        status: ChastPageStatus.success,
        characters: List.of(state.characters)..addAll(list.$1),
        hasReachedEnd: list.$2.next == null,
        currentPage: state.currentPage + 1,
      ),
    );
  }

  Future<void> searchCharacter(
      SearchEvent event, Emitter<CastState> emit) async {
    emit(state.copyWith(status: ChastPageStatus.loading, currentPage: 1));

    final list = await await locator<GetAllCharacters>()
        .call(page: state.currentPage, filter: event.searchValue);

    emit(
      state.copyWith(
        status: ChastPageStatus.success,
        characters: list.$1,
        hasReachedEnd: list.$2.next == null,
        currentPage: state.currentPage + 1,
      ),
    );
  }
}
