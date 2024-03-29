import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/layers/data/datasources/local/db/db_init.dart';
import 'package:rick_and_morty/layers/data/datasources/local/favourite_character_dao.dart';
import 'package:rick_and_morty/layers/data/datasources/remote/allCharacterApi.dart';
import 'package:rick_and_morty/layers/data/datasources/remote/dio/dio_init.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/data/repositories_impl/character_repository_impl.dart';
import 'package:rick_and_morty/layers/data/repositories_impl/favourite_character_impl.dart';
import 'package:rick_and_morty/layers/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/layers/domain/repositories/favourite_repository.dart';
import 'package:rick_and_morty/layers/domain/usecases/favourite_character.dart';

import '../../layers/domain/usecases/get_all_characters.dart';

final locator = GetIt.instance;

void diSetup() {
  //core service db and api initialization
  locator
    ..registerSingletonAsync(() => DioSingleton.instance.create())
    ..registerSingletonAsync(() => DbSingleton.instance.create())
    ..registerSingleton<DbUtil>(DbUtil())
    ..registerSingleton<DioUtil>(DioUtil())
    //network api
    ..registerSingleton<Api>(GetAllCharacterApi(dio: locator()))
    ..registerSingleton<GetAllCharacterApi>(GetAllCharacterApi(dio: locator()))
    ..registerSingleton<CharacterRepository>(
        CharacterRepositoryImpl(api: locator()))
    ..registerSingleton<CharacterRepositoryImpl>(
        CharacterRepositoryImpl(api: locator()))
    ..registerSingleton<GetAllCharacters>(
        GetAllCharacters(repository: locator()))
    //local db
    ..registerSingleton<Dao>(CharacterDaoImple(dbUtil: locator()))
    ..registerSingleton<CharacterDaoImple>(CharacterDaoImple(dbUtil: locator()))
    ..registerSingleton<FavouriteRepository>(
        FavouriteRepositoryImpl(dao: locator()))
    ..registerSingleton<FavouriteRepositoryImpl>(
        FavouriteRepositoryImpl(dao: locator()))
    ..registerSingleton<FavouriteCharcter>(
        FavouriteCharcter(repository: locator()));
}
