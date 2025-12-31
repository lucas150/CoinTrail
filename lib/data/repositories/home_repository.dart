import '../mock/home_mock_data.dart';
import 'package:cointrail/data/models/category_spending_model.dart';
import 'package:cointrail/data/models/monthly_summary_model.dart';
import 'package:cointrail/data/models/transaction_model.dart';
import 'package:cointrail/data/models/expense_summary_model.dart';
import 'package:cointrail/data/models/incomeSummaryModel.dart';

class HomeRepository {
  String getUserName() => HomeMockData.userName;

  MonthlySummaryModel getMonthlySummary() => HomeMockData.monthlySummary;

  ExpenseSummaryModel getExpenseSummary() => HomeMockData.expenseSummary;

  IncomeSummaryModel getIncomeSummary() => HomeMockData.incomeSummary;

  List<CategorySpendingModel> getCategories() => HomeMockData.categories;

  List<TransactionModel> getRecentTransactions({int limit = 5}) {
    return HomeMockData.transactions.take(limit).toList();
  }

  void addTransaction(TransactionModel transaction) {
    HomeMockData.transactions.insert(0, transaction);
  }

  List<TransactionModel> getAllTransactions() {
    return List.unmodifiable(HomeMockData.transactions);
  }
}
