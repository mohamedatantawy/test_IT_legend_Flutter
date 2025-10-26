import 'package:it_test/feature/Filtering/data/models/filteringmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('filter.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2, // ⭐ Increment version from 1 to 2
      onCreate: _createDB,
      onUpgrade: _onUpgrade, // ⭐ Add migration
    );
  }

  // Initial database creation
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE filtering(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kindName TEXT NOT NULL,
        category TEXT
      )
    ''');
  }

  // Migration from version 1 to version 2
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add the category column
      await db.execute('ALTER TABLE filtering ADD COLUMN category TEXT');
      print('Database upgraded: Added category column');
    }
  }

  // INSERT
  Future<int> insertUser(Filteringmodel user) async {
    final db = await instance.database;
    return await db.insert('filtering', user.toMap());
  }

  // READ ALL
  Future<List<Filteringmodel>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('filtering');
    return result.map((json) => Filteringmodel.fromMap(json)).toList();
  }

  // READ ONE by ID
  Future<Filteringmodel?> getUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'filtering',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Filteringmodel.fromMap(maps.first);
    }
    return null;
  }

  // READ ONE by Category
  Future<Filteringmodel?> getUserByCategory(String category) async {
    final db = await instance.database;
    final maps = await db.query(
      'filtering',
      where: 'category = ?',
      whereArgs: [category],
    );
    if (maps.isNotEmpty) {
      return Filteringmodel.fromMap(maps.first);
    }
    return null;
  }

  // UPDATE
  Future<int> updateUser(Filteringmodel user) async {
    final db = await instance.database;
    return db.update(
      'filtering',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // DELETE
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return db.delete('filtering', where: 'id = ?', whereArgs: [id]);
  }

  // DELETE ALL
  Future<int> deleteAllUsers() async {
    final db = await instance.database;
    return await db.delete('filtering');
  }

  // DELETE DATABASE (for testing)
  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'filter.db');
    await databaseFactory.deleteDatabase(path);
    _database = null;
    print('Database deleted successfully');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}