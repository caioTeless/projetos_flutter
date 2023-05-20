import 'package:control_app/model/fuel_control_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataHelperDb {
  static const tableName = 'control_table';
  static const dbName = 'fuel_control.db';
  static const querySql =
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, liters REAL, total REAL);';

  Future<Database> _getDatabase() async {
    final path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(querySql);
      },
      version: 1,
    );
  }

  Future insert(FuelControl fuelControl) async {
    Database db;
    db = await _getDatabase();
    db.insert(
      tableName,
      fuelControl.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(FuelControl fuelControl) async {
    Database db;
    db = await _getDatabase();
    db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [fuelControl.id],
    );
  }

  Future update(FuelControl fuelControl) async {
    Database db;
    db = await _getDatabase();
    db.update(
      tableName,
      fuelControl.toMap(),
      where: 'id = ?',
      whereArgs: [fuelControl.id],
    );
  }

  Future<FuelControl> readById(int id) async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return FuelControl.fromMap(data[0]);
  }

  Future<List<FuelControl>> readAll() async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(tableName);
    return List.generate(
      data.length,
      (index) => FuelControl.fromMap(data[index]),
    );
  }
}
