import 'dart:developer';

import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/data/models/character_dto.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';

abstract class Dao {
  Future<void> saveFavouriteCharcter(Character character);
  Future<List<CharacterDto>> getFavouriteCharcters();
  Future<void> removeFavouriteCharcter(String id);
  Future<bool> showFavouriteCharcter(String id);
}

final class CharacterDaoImple implements Dao {
  final DbUtil _dbUtil;

  CharacterDaoImple({required DbUtil dbUtil}) : _dbUtil = dbUtil;
  @override
  Future<void> saveFavouriteCharcter(Character character) async {
    CharacterDto dto = CharacterDto(
      id: character.id,
      gender: character.gender,
      image: character.image,
      location: character.location,
      name: character.name,
      origin: character.origin,
      species: character.species,
      status: character.status,
      type: character.type,
    );

    try {
      int response =
          await _dbUtil.saveData(TableConst.kCharacterTableName, dto.toMap());
      log(response.toString());
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }

  @override
  Future<List<CharacterDto>> getFavouriteCharcters() async {
    try {
      List<Map<String, dynamic>> response =
          await _dbUtil.getAllData(TableConst.kCharacterTableName);
      log(response.toString());
      List<CharacterDto> characters =
          response.map((e) => CharacterDto.fromMapDb(e)).toList();
      return characters;
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }

  @override
  Future<void> removeFavouriteCharcter(String id) async {
    int cartCount = await _dbUtil.deleteData(
        table: TableConst.kCharacterTableName,
        where: "${TableConst.Kid} = ?",
        id: id);
    log(cartCount.toString());
  }

  @override
  Future<bool> showFavouriteCharcter(String id) async {
    try {
      List<Map<String, dynamic>> favourite = await _dbUtil.getDataByID(
          table: TableConst.kCharacterTableName,
          where: "${TableConst.Kid} = ?",
          id: id);
      if (favourite.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
