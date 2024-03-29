import 'package:rick_and_morty/layers/data/models/character_dto.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';

import 'package:rick_and_morty/layers/domain/repositories/character_repository.dart';

final class GetAllCharacters {
  GetAllCharacters({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  Future<(List<Character>, InfoClass)> call(
      {int page = 0, Map<String, String>? filter}) async {
    final list = await _repository.getCharacters(page: page, filter: filter);
    return list;
  }
}
