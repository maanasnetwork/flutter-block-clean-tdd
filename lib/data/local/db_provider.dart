import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import './config.dart';

class SQLiteDbProvider {
  static Database db;

  static Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), AppDatabaseConfig.databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: AppDatabaseConfig.databaseVersion,
    );
  }

  static void _createDb(Database db) {
    AppDatabaseConfig.createTablesQueries.forEach((createTableQuery) async {
      await db.execute(createTableQuery);
    });
  }

  static Future<void> clear() async {
    await deleteDatabase(
        join(await getDatabasesPath(), AppDatabaseConfig.databaseName));
  }
}
