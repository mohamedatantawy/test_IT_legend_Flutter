import 'package:bloc/bloc.dart';
import 'package:it_test/feature/Home/data/SqliteData/productSqlite.dart';
import 'package:it_test/feature/Home/data/models/productmodel.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductDatabaseHelper _databaseHelper = ProductDatabaseHelper.instance;

  // Sample products data
  final List<ProductModel> sampleProducts = [
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 5000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
    ProductModel(
      image: 'asset/image/Picture1.png',
      title: 'جاكيت من الصوف مناسب',
      price: 6000000,
      discount: 3000000,
      count: 'تم بيع 3.3k+',
    ),
  ];

  // Initialize database with sample products
  Future<void> initializeProducts() async {
    try {
      emit(ProductLoading());

      // Check if products already exist
      final existingProducts = await _databaseHelper.getAllProducts();

      if (existingProducts.isEmpty) {
        // Insert sample products if database is empty
        await _databaseHelper.insertProducts(sampleProducts);
        print('Inserted ${sampleProducts.length} sample products');
      } else {
        print('Products already exist: ${existingProducts.length}');
      }

      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
      print('Initialize error: $e');
    }
  }

  // Insert single product
  Future<void> addProduct(ProductModel product) async {
    try {
      emit(ProductLoading());
      await _databaseHelper.insertProduct(product);
      print('Product added: ${product.title}');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Insert multiple products
  Future<void> addProducts(List<ProductModel> products) async {
    try {
      emit(ProductLoading());
      await _databaseHelper.insertProducts(products);
      print('Added ${products.length} products');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Fetch all products
  Future<void> fetchAllProducts() async {
    try {
      emit(ProductLoading());
      final products = await _databaseHelper.getAllProducts();
      print('Fetched ${products.length} products');
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
      print('Fetch error: $e');
    }
  }

  // Search products
  Future<void> searchProducts(String query) async {
    try {
      emit(ProductLoading());
      if (query.isEmpty) {
        await fetchAllProducts();
        return;
      }
      final products = await _databaseHelper.searchProducts(query);
      print('Found ${products.length} products for "$query"');
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Get discounted products
  Future<void> fetchDiscountedProducts() async {
    try {
      emit(ProductLoading());
      final products = await _databaseHelper.getDiscountedProducts();
      print('Found ${products.length} discounted products');
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Filter by price range
  Future<void> filterByPrice(num minPrice, num maxPrice) async {
    try {
      emit(ProductLoading());
      final products = await _databaseHelper.getProductsByPriceRange(
        minPrice,
        maxPrice,
      );
      print('Found ${products.length} products between $minPrice - $maxPrice');
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Filter by room count
  Future<void> filterByRoomCount(String count) async {
    try {
      emit(ProductLoading());
      final allProducts = await _databaseHelper.getAllProducts();
      final filteredProducts = allProducts
          .where((p) => p.count == count)
          .toList();
      print('Found ${filteredProducts.length} products with $count');
      emit(ProductSuccess(products: filteredProducts));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Update product
  Future<void> updateProduct(ProductModel product) async {
    try {
      emit(ProductLoading());
      await _databaseHelper.updateProduct(product);
      print('Product updated: ${product.title}');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Delete product
  Future<void> deleteProduct(int id) async {
    try {
      emit(ProductLoading());
      await _databaseHelper.deleteProduct(id);
      print('Product deleted: ID $id');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Get products count
  Future<int> getProductsCount() async {
    try {
      final count = await _databaseHelper.getProductsCount();
      print('Total products: $count');
      return count;
    } catch (e) {
      emit(ProductFailure(e.toString()));
      return 0;
    }
  }

  // Clear all products
  Future<void> clearAllProducts() async {
    try {
      emit(ProductLoading());
      await _databaseHelper.deleteAllProducts();
      print('All products cleared');
      emit(ProductSuccess(products: []));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Reset database with fresh sample data
  Future<void> resetDatabase() async {
    try {
      emit(ProductLoading());
      await _databaseHelper.deleteDatabaseFile();
      await _databaseHelper.insertProducts(sampleProducts);
      print('Database reset with ${sampleProducts.length} products');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // Re-seed database (clear and add sample products)
  Future<void> reseedProducts() async {
    try {
      emit(ProductLoading());
      await _databaseHelper.deleteAllProducts();
      await _databaseHelper.insertProducts(sampleProducts);
      print('Reseeded ${sampleProducts.length} products');
      await fetchAllProducts();
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
