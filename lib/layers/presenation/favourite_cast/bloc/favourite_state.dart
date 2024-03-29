part of 'favourite_bloc.dart';

sealed class FavouritePageState extends Equatable {
  const FavouritePageState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouritePageState {}

final class FavouriteLoading extends FavouritePageState {}

final class FavouriteLoaded extends FavouritePageState {
  final List<Character> characters;

  FavouriteLoaded({required this.characters});
}

final class FavouriteDeted extends FavouritePageState {}

final class FavouriteAdded extends FavouritePageState {}

final class FavouriteError extends FavouritePageState {}
