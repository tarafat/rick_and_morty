import 'package:rick_and_morty/layers/data/models/character_dto.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<(List<Character>, InfoClass)> getCharacters(
      {int page = 0, Map<String, String>? filter});
}
