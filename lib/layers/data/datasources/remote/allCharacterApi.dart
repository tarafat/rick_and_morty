import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/data/models/character_dto.dart';

abstract class Api {
  Future<(List<CharacterDto>, InfoClass)> loadCharacters({
    int page = 0,
    Map<String, String>? filter,
  });
}

final class GetAllCharacterApi implements Api {
  GetAllCharacterApi({required DioUtil dio}) : _dio = dio;
  final DioUtil _dio;

  @override
  Future<(List<CharacterDto>, InfoClass)> loadCharacters({
    int page = 0,
    Map<String, String>? filter,
  }) async {
    final query = '''
query Characters { characters(page: $page,filter:$filter) { info { count next pages } results { id name status species type gender image created origin { id name type dimension created } location { id name type dimension created } } } }
  ''';
    try {
      var response =
          await _dio.postHttp(Strings.url + '/graphql', {'query': query});
      if (response.statusCode == 200) {
        final info =
            InfoClass.fromJson(response.data['data']['characters']['info']);
        final character =
            (response.data['data']['characters']['results'] as List)
                .map((e) => CharacterDto.fromMap(e))
                .toList();
        return (character, info);
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
