import 'dart:async';
import 'package:it_test/feature/AllProducts/data/models/detailCardmodel.dart';
import 'package:it_test/feature/AllProducts/data/models/titleCardmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;

  static Database? _database;

  DatabaseHelper._internal();
Future<void> deleteDatabase() async {
  String path = join(await getDatabasesPath(), 'detailCard.db');
  await databaseFactory.deleteDatabase(path);
  _database = null;
}
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'detailCard.db');
    return await openDatabase(path, version:4, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
  await db.execute('''
    CREATE TABLE DetailCard (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      num_view INTEGER NOT NULL
    )
  ''');

  await db.execute('''
    CREATE TABLE TitleCard (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      detail_card_id INTEGER,
      icon_code INTEGER NOT NULL,
      title TEXT NOT NULL,
      subtitle TEXT,
      FOREIGN KEY (detail_card_id) REFERENCES DetailCard (id) ON DELETE CASCADE
    )
  ''');
}
Future<int> insertDetailCard(Detailcardmodel detailCard) async {
  final db = await database;
  
  // First insert the DetailCard
  int detailCardId = await db.insert('DetailCard', detailCard.toMap());
  
  // Then insert related TitleCards with the detailCardId
  for (var titleCard in detailCard.titlecardmodel) {
    await db.insert('TitleCard', {
      'detail_card_id': detailCardId,
      'icon_code': titleCard.icon.codePoint,
      'title': titleCard.title,
      'subtitle': titleCard.subtitle,
    });
  }
  
  return detailCardId;
}
 Future<List<Detailcardmodel>> getDetailCards() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('DetailCard');

  List<Detailcardmodel> detailCards = [];
  
  for (var map in maps) {
    // Fetch related TitleCards for this DetailCard
    final List<Map<String, dynamic>> titleCardMaps = await db.query(
      'TitleCard',
      where: 'detail_card_id = ?',
      whereArgs: [map['id']],
    );

    // Convert TitleCard maps to Titlecardmodel objects
    List<Titlecardmodel> titleCards = titleCardMaps.map((titleMap) {
      return Titlecardmodel.fromMap(titleMap);
    }).toList();

    // Create Detailcardmodel with its TitleCards
    detailCards.add(Detailcardmodel(
      id: map['id'],
      name: map['name'],
      num_view: map['num_view'],
      titlecardmodel: titleCards,
    ));
  }

  return detailCards;
}
}
