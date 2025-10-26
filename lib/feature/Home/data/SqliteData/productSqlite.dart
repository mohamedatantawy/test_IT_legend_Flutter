import 'package:it_test/feature/Home/data/models/productmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductDatabaseHelper {
  static final ProductDatabaseHelper instance = ProductDatabaseHelper._init();
  static Database? _database;

  ProductDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT NOT NULL,
        title TEXT NOT NULL,
        price REAL NOT NULL,
        discount REAL NOT NULL,
        count TEXT NOT NULL
      )
    ''');
  }

  // ============ CRUD OPERATIONS ============

  // CREATE - Insert a product
  Future<int> insertProduct(ProductModel product) async {
    final db = await instance.database;
    return await db.insert('products', product.toMap());
  }

  // CREATE - Insert multiple products
  Future<void> insertProducts(List<ProductModel> products) async {
    final db = await instance.database;
    final batch = db.batch();
    
    for (var product in products) {
      batch.insert('products', product.toMap());
    }
    
    await batch.commit(noResult: true);
  }

  // READ - Get all products
  Future<List<ProductModel>> getAllProducts() async {
    final db = await instance.database;
    final result = await db.query('products', orderBy: 'id DESC');
    return result.map((json) => ProductModel.fromMap(json)).toList();
  }

  // READ - Get product by ID
  Future<ProductModel?> getProduct(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (maps.isNotEmpty) {
      return ProductModel.fromMap(maps.first);
    }
    return null;
  }

  // READ - Search products by title
  Future<List<ProductModel>> searchProducts(String query) async {
    final db = await instance.database;
    final result = await db.query(
      'products',
      where: 'title LIKE ?',
      whereArgs: ['%$query%'],
    );
    return result.map((json) => ProductModel.fromMap(json)).toList();
  }

  // READ - Get products with discount
  Future<List<ProductModel>> getDiscountedProducts() async {
    final db = await instance.database;
    final result = await db.query(
      'products',
      where: 'discount > ?',
      whereArgs: [0],
      orderBy: 'discount DESC',
    );
    return result.map((json) => ProductModel.fromMap(json)).toList();
  }

  // READ - Get products by price range
  Future<List<ProductModel>> getProductsByPriceRange(num minPrice, num maxPrice) async {
    final db = await instance.database;
    final result = await db.query(
      'products',
      where: 'price BETWEEN ? AND ?',
      whereArgs: [minPrice, maxPrice],
      orderBy: 'price ASC',
    );
    return result.map((json) => ProductModel.fromMap(json)).toList();
  }

  // UPDATE - Update a product
  Future<int> updateProduct(ProductModel product) async {
    final db = await instance.database;
    return db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
     // whereArgs: [product.id],
    );
  }

  // DELETE - Delete a product
  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - Delete all products
  Future<int> deleteAllProducts() async {
    final db = await instance.database;
    return await db.delete('products');
  }

  // COUNT - Get total products count
  Future<int> getProductsCount() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM products');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  // UTILITY - Delete database (for testing)
  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');
    await databaseFactory.deleteDatabase(path);
    _database = null;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}