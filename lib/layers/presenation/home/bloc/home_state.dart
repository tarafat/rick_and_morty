part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Character>? allCaracter;
  final List<Character>? favouriteCaharacter;

  HomeLoaded({this.allCaracter, this.favouriteCaharacter});

  HomeLoaded copyWith({
    List<Character>? allCaracter,
    List<Character>? favouriteCaharacter,
  }) {
    return HomeLoaded(
      allCaracter: allCaracter ?? this.allCaracter,
      favouriteCaharacter: favouriteCaharacter ?? this.favouriteCaharacter,
    );
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
