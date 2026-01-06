import 'package:flutter/material.dart';

class AnalysisController extends ChangeNotifier {
  DateTimeRange range = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  );

  double totalIncome = 5200;
  double totalExpense = 3400;

  double get balance => totalIncome - totalExpense;

  final Map<String, double> categoryBreakdown = {
    'Food': 1200,
    'Transport': 600,
    'Shopping': 900,
    'Bills': 700,
  };

  void updateRange(DateTimeRange newRange) {
    range = newRange;
    notifyListeners();
  }
}
