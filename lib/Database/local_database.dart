import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class LocalDatabaseHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'webtoons.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE webtoons(id TEXT PRIMARY KEY, title TEXT, description TEXT, author TEXT, imageurl TEXT, genre TEXT, rating FLOAT, isFavorite BOOLEAN)');
    }, version: 1);
  }

  static Future<void> insertData(
      String tableName, Map<String, dynamic> tableData) async {
    final db = await LocalDatabaseHelper.database();
    db.insert(
      tableName,
      tableData,
    );
  }

  static Future<void> updateData(
      String tableName, Map<String, dynamic> tableData) async {
    final db = await LocalDatabaseHelper.database();
    await db.update(tableName, tableData,
        where: 'id = ?', whereArgs: [tableData['id']]);
  }

  static Future<void> deleteData(String tableName, String id) async {
    final db = await LocalDatabaseHelper.database();
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getData(String tablename) async {
    final db = await LocalDatabaseHelper.database();
    return db.query(tablename);
  }
}
