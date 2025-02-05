import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, nickname TEXT, age INTEGER)''',
      );
    });
  }

  // Insert Data
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  // Get All Users
  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    printTables();
    return await db.query('users');
  }

  // Update User
  Future<int> updateUser(int id, Map<String, dynamic> user) async {
    final db = await database;
    return await db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  // Delete User
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  void printTables() async {
    final db = await database;
    final tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    print(tables);  // Print all tables in the database
  }
}
