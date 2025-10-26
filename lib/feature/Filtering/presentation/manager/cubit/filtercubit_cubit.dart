import 'package:bloc/bloc.dart';
import 'package:it_test/feature/Filtering/data/ResoureData/databaseFilter.dart';
import 'package:it_test/feature/Filtering/data/models/filteringmodel.dart';
import 'package:meta/meta.dart';

part 'filtercubit_state.dart';

class FiltercubitCubit extends Cubit<FiltercubitState> {
  FiltercubitCubit() : super(FiltercubitInitial());

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // Your data with categories
  final List<Filteringmodel> filterings = [
    Filteringmodel(
      kindName: const ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
      category: 'نوع العقار', // Property Type
    ),
    Filteringmodel(
      kindName: const ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'],
      category: 'عدد الغرف', // Number of Rooms
    ),
    Filteringmodel(
      kindName: const ['أى', 'تقسيط', 'كاش'],
      category: 'طريقة الدفع', // Payment Method
    ),
    Filteringmodel(
      kindName: const ['أى', 'جاهز', 'قيد الأنشاء'],
      category: 'حالة العقار', // Property Status
    ),
  ];

  // Insert all filtering data
  Future<void> insertFiltering() async {
    try {
      emit(FilteringLoading());

      // Check if data already exists
      final existing = await _databaseHelper.getAllUsers();
      if (existing.isNotEmpty) {
        print("Data already exists, skipping insert");
        await fetchAllProducts();
        return;
      }

      // Insert each filter category
      for (var filtering in filterings) {
        await _databaseHelper.insertUser(filtering);
      }

      print("Inserted ${filterings.length} filter categories");
      await fetchAllProducts();
    } catch (e) {
      emit(FilteringFailure(e.toString()));
      print("Insert failure: $e");
    }
  }

  // Fetch all filters
  Future<void> fetchAllProducts() async {
    try {
      final List<Filteringmodel> filterings = 
          await _databaseHelper.getAllUsers();

      print("Fetched ${filterings.length} filter categories:");
      for (var f in filterings) {
        print("  ${f.category}: ${f.kindName}");
      }

      emit(FilteringSuccess(filterings: filterings));
    } catch (e) {
      emit(FilteringFailure(e.toString()));
      print("Fetch failure: $e");
    }
  }

  // Get specific filter by category
  Future<Filteringmodel?> getFilterByCategory(String category) async {
    try {
      final all = await _databaseHelper.getAllUsers();
      return all.firstWhere(
        (f) => f.category == category,
        orElse: () => throw Exception('Category not found'),
      );
    } catch (e) {
      print("Error fetching category: $e");
      return null;
    }
  }

  // Clear all data and re-insert
  Future<void> resetFilters() async {
    try {
      emit(FilteringLoading());
    //  await _databaseHelper.deleteUser();
      await insertFiltering();
    } catch (e) {
      emit(FilteringFailure(e.toString()));
    }
  }
}