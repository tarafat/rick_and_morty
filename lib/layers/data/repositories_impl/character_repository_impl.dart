import 'package:rick_and_morty/layers/data/datasources/remote/allCharacterApi.dart';
import 'package:rick_and_morty/layers/data/models/character_dto.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/domain/repositories/character_repository.dart';

final class CharacterRepositoryImpl implements CharacterRepository {
  final Api _api;

  CharacterRepositoryImpl({
    required Api api,
  }) : _api = api;

  @override
  Future<(List<Character>, InfoClass)> getCharacters(
      {int page = 0, Map<String, String>? filter}) async {
    final fetchedList = await _api.loadCharacters(page: page, filter: filter);
    return fetchedList;
  }
}
