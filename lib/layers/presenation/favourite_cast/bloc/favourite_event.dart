part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllCharacterEvent extends FavouriteEvent {
  const FetchAllCharacterEvent();
}

final class AddFavouriteEvent extends FavouriteEvent {
  final Character character;
  const AddFavouriteEvent(this.character);
}

final class DeleteFavouriteEvent extends FavouriteEvent {
  final String id;
  const DeleteFavouriteEvent(this.id);
}
