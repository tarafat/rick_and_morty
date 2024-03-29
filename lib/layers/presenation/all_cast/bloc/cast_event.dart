part of 'cast_bloc.dart';

sealed class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextEvent extends CastEvent {
  const FetchNextEvent();
}

final class SearchEvent extends CastEvent {
  final Map<String, String>? searchValue;
  const SearchEvent(this.searchValue);
}
