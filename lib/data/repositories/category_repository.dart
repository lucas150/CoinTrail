import '../mock/category_mock_data.dart';
import '../models/category_model.dart';

class CategoryRepository {
  List<CategoryModel> getExpenseCategories() {
    return CategoryMockData.expenseCategories;
  }

  List<CategoryModel> getIncomeCategories() {
    return CategoryMockData.incomeCategories;
  }

  List<CategoryModel> getAllCategories() {
    return CategoryMockData.all;
  }
}
