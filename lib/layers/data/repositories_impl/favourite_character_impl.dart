import 'package:rick_and_morty/layers/data/datasources/local/favourite_character_dao.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/repositories/favourite_repository.dart';

final class FavouriteRepositoryImpl implements FavouriteRepository {
  final Dao _dao;

  FavouriteRepositoryImpl({required Dao dao}) : _dao = dao;

  @override
  Future<void> addFavouriteCharacter(Character character) async {
    await _dao.saveFavouriteCharcter(character);
  }

  @override
  Future<List<Character>> getFavouriteCharacters() async {
    final fetchedList = await _dao.getFavouriteCharcters();
    return fetchedList;
  }

  @override
  Future<void> removeFavouriteCharacter(String id) async {
    await _dao.removeFavouriteCharcter(id);
  }

  @override
  Future<bool> showFavouriteCharacter(String id) {
    return _dao.showFavouriteCharcter(id);
  }
}
