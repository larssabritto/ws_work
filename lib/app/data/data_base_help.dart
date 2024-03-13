import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'db.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE leads (
        id INTEGER PRIMARY KEY,
        carName TEXT,
        userContactInfo TEXT
      )
    ''');
  }

  Future<void> saveLead(String carName, String userContactInfo) async {
    final Database db = await database;
    await db.insert(
      'leads',
      {'carName': carName, 'userContactInfo': userContactInfo},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
