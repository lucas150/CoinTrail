import 'package:flutter/material.dart';
import 'package:cointrail/data/models/category_model.dart';
import 'package:cointrail/data/models/transaction_model.dart';
import 'package:cointrail/data/mock/home_mock_data.dart';

class SearchFilterController extends ChangeNotifier {
  // ───────── CATEGORY ─────────
  CategoryModel? selectedCategory;
  bool showCategorySelector = false;

  // ───────── DATE ─────────
  DateTime focusedMonth = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;
  bool showCalendar = false;

  // ───────── REPORT ─────────
  bool isExpense = true;

  // ───────── RESULTS ─────────
  List<TransactionModel> results = [];

  // ───────── UI ACTIONS ─────────
  void toggleCalendar() {
    showCalendar = !showCalendar;
    notifyListeners();
  }

  void closeCalendar() {
    showCalendar = false;
    notifyListeners();
  }

  void toggleCategorySelector() {
    showCategorySelector = !showCategorySelector;
    notifyListeners();
  }

  void closeCategorySelector() {
    showCategorySelector = false;
    notifyListeners();
  }

  void setFocusedMonth(DateTime month) {
    focusedMonth = month;
    notifyListeners();
  }

  // ───────── SETTERS ─────────
  void setCategory(CategoryModel? category) {
    selectedCategory = category;
    notifyListeners();
  }

  void setDateRange(DateTime? start, DateTime? end) {
    rangeStart = start;
    rangeEnd = end;
    notifyListeners();
  }

  void setReportType(bool expense) {
    isExpense = expense;
    notifyListeners();
  }

  // ───────── SEARCH ─────────
  void search() {
    results = HomeMockData.transactions.where((tx) {
      // type
      if (isExpense && tx.type != TransactionType.expense) return false;
      if (!isExpense && tx.type != TransactionType.income) return false;

      // category
      if (selectedCategory != null && tx.category != selectedCategory!.name) {
        return false;
      }

      // date
      if (rangeStart != null && tx.date.isBefore(rangeStart!)) return false;
      if (rangeEnd != null && tx.date.isAfter(rangeEnd!)) return false;

      return true;
    }).toList();

    notifyListeners();
  }

  void clear() {
    selectedCategory = null;
    rangeStart = null;
    rangeEnd = null;
    isExpense = true;
    results = [];
    notifyListeners();
  }
}
