part of 'check_favourite_cubit.dart';

sealed class CheckFavouriteState extends Equatable {
  const CheckFavouriteState();

  @override
  List<Object> get props => [];
}

final class CheckFavouriteInitial extends CheckFavouriteState {}

final class FavouriteState extends CheckFavouriteState {}

final class FavouriteDefaultState extends CheckFavouriteState {}
