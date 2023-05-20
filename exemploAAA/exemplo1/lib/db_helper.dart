import 'package:exemplo1/exemplo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableName = 'exemplo_table';
  static const dbName = 'exemplo.db';
  static const querySql =
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, name TEXT, number REAL);';

  Future<Database> _getDatabase() async {
    final path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(querySql);
      },
      version: 2,
    );
  }

  Future create(ExemploModel exemploModel) async {
    Database db;
    db = await _getDatabase();
    db.insert(
      tableName,
      exemploModel.toMap(),
    );
  }

  Future delete(ExemploModel exemploModel) async {
    Database db;
    db = await _getDatabase();
    db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [exemploModel.id],
    );
  }

  Future update(ExemploModel exemploModel) async {
    Database db;
    db = await _getDatabase();
    db.update(
      tableName,
      exemploModel.toMap(),
      where: 'id = ?',
      whereArgs: [exemploModel.id],
    );
  }

  Future<ExemploModel> readById(int id) async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return ExemploModel.fromMap(data[0]);
  }

  Future<List<ExemploModel>> readAll() async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(tableName);
    return List.generate(
      data.length,
      (index) => ExemploModel.fromMap(data[index]),
    );
  }

  Future close() async{
    Database db;
    db = await _getDatabase();
    db.close();
  }
}
