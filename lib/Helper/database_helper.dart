import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, '$databaseName.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            '''
          CREATE TABLE ${tableName} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ${MyString.name} TEXT,
            ${MyString.role} TEXT,
            ${MyString.fromDate} TEXT,
            ${MyString.toDate} TEXT
          )
          '''
        );
      },
    );
  }


  Future<List<Map<String, dynamic>>> getEmployees() async {
    final db = await database;
    return db.query(tableName);
  }

  Future<void> addEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    await db.insert(tableName, employee,conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<void> updateEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    await db.update(
      tableName,
      employee,
      where: 'id = ?',
      whereArgs: [employee['id']],
    );
  }

  Future<void> deleteEmployee(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
