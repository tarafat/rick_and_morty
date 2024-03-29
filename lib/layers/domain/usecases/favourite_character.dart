import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/repositories/favourite_repository.dart';

final class FavouriteCharcter {
  FavouriteCharcter({
    required FavouriteRepository repository,
  }) : _repository = repository;

  final FavouriteRepository _repository;

  Future<void> addFavourite(Character character) async {
    await _repository.addFavouriteCharacter(character);
  }

  Future<List<Character>> getFavouriteList() async {
    List<Character> characters = await _repository.getFavouriteCharacters();
    return characters;
  }

  Future<void> removeFavourite(String id) async {
    await _repository.removeFavouriteCharacter(id);
  }

  Future<bool> showFavourite(String id) async {
    return await _repository.showFavouriteCharacter(id);
  }
}
