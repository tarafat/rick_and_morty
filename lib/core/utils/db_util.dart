import 'package:rick_and_morty/layers/data/datasources/local/db/db_init.dart';
import 'package:sqflite/sqflite.dart';

final class DbUtil {
  Future<int> saveData(String table, Map<String, Object?> data) =>
      DbSingleton.instance.db
          .insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);

  Future<List<Map<String, dynamic>>> getAllData(String table,
          [int? limit, int? offset]) =>
      DbSingleton.instance.db.query(table, limit: limit, offset: offset);

  Future<List<Map<String, dynamic>>> getDataByID(
          {required String table, required String where, required String id}) =>
      DbSingleton.instance.db.query(table, where: where, whereArgs: [id]);

  Future<List<Map<String, dynamic>>> queryString(String query) =>
      DbSingleton.instance.db.rawQuery(query);

  Future<int> deleteData(
          {required String table, required String where, required String id}) =>
      DbSingleton.instance.db.delete(table, where: where, whereArgs: [id]);
}
