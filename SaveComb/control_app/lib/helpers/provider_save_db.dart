import 'package:control_app/models/save_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProviderSaveDb {
  static const tableName = 'fuel_data';
  static const providerDb = 'fuel.db';
  static const querySql =
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, liters TEXT, value TEXT);';

  Future<Database> _getDatabase() async {
    final path = join(await getDatabasesPath(), tableName);
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(querySql);
    });
  }

  Future create(SaveModel saveModel) async {
    Database db;
    db = await _getDatabase();
    db.insert(
      tableName,
      saveModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(SaveModel saveModel) async {
    Database db;
    db = await _getDatabase();
    db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [saveModel.id],
    );
  }

  Future update(SaveModel saveModel) async {
    Database db;
    db = await _getDatabase();
    db.update(
      tableName,
      saveModel.toMap(),
      where: 'id = ?',
      whereArgs: [saveModel.id],
    );
  }

  Future<SaveModel> readById(int id) async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return SaveModel.fromMap(data[0]);
  }

  Future<List<SaveModel>> readAll() async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(tableName);
    return List.generate(
      data.length,
      (index) => SaveModel.fromMap(
        data[index],
      ),
    );
  }
}
