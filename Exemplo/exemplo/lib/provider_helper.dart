import 'package:exemplo/cont.dart';
import 'package:exemplo/provider_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProviderHelper {
  static const tableName = 'example';
  static const querySql =
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);';

  Future<Database> _getDatabase() async {
    print('Get database metodo');
    final path = join(await getDatabasesPath(), kDatabase);
    print('sai udo path');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(querySql);
      },
      version: 2,
    );
  }

  Future<int> insert(ProviderModel provider) async {
    Database db;
    print('metodo insert');
    db = await _getDatabase();
    print('saiu do get_database do insert');
    return db.insert(
      tableName,
      provider.toMap(),
    );
  }
}
