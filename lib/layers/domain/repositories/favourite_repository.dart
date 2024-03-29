import 'package:rick_and_morty/layers/domain/entities/character.dart';

abstract class FavouriteRepository {
  Future<List<Character>> getFavouriteCharacters();
  Future<void> addFavouriteCharacter(Character character);
  Future<void> removeFavouriteCharacter(String id);
  Future<bool> showFavouriteCharacter(String id);
}
