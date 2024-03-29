import 'package:path/path.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:sqflite/sqflite.dart';

final class DbSingleton {
  static final DbSingleton _singleton = DbSingleton._internal();
  DbSingleton._internal();
  static DbSingleton get instance => _singleton;

  static const databaseVersion = 1;
  static const _databaseName = 'com.rickandmorty.org';
  late Database db;

  Future<Database> create() async {
    db = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createTablesV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
    return db;
  }

  void _createTablesV1(Batch batch) {
    batch.execute('''
       create TABLE  ${TableConst.kCharacterTableName}
       (
        ${TableConst.Kid} TEXT PRIMARY KEY,
        ${TableConst.Kgender} TEXT,
        ${TableConst.Kimage} TEXT,
        ${TableConst.Kname} TEXT,
        ${TableConst.Kspecies} TEXT,
        ${TableConst.Ktype} TEXT,
        ${TableConst.Kstatus} TEXT,
        ${TableConst.Klocation} BLOB,
        ${TableConst.Korigin} BLOB
       )
       ''');
  }
}
