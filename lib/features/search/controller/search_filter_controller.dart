import 'package:flutter/material.dart';
import 'package:cointrail/data/models/category_model.dart';
import 'package:cointrail/data/models/transaction_model.dart';
import 'package:cointrail/data/mock/home_mock_data.dart';

// class SearchFilterController extends ChangeNotifier {
//   // ───────── CATEGORY ─────────
//   CategoryModel? selectedCategory;
//   bool showCategorySelector = false;

//   // ───────── DATE ─────────
//   DateTime focusedMonth = DateTime.now();
//   DateTime? rangeStart;
//   DateTime? rangeEnd;
//   bool showCalendar = false;

//   // ───────── REPORT ─────────
//   bool isExpense = true;

//   // ───────── RESULTS ─────────
//   List<TransactionModel> results = [];

//   // ───────── UI ACTIONS ─────────
//   void toggleCalendar() {
//     showCalendar = !showCalendar;
//     notifyListeners();
//   }

//   void closeCalendar() {
//     showCalendar = false;
//     notifyListeners();
//   }

//   void toggleCategorySelector() {
//     showCategorySelector = !showCategorySelector;
//     notifyListeners();
//   }

//   void closeCategorySelector() {
//     showCategorySelector = false;
//     notifyListeners();
//   }

//   void setFocusedMonth(DateTime month) {
//     focusedMonth = month;
//     notifyListeners();
//   }

//   // ───────── SETTERS ─────────
//   void setCategory(CategoryModel? category) {
//     selectedCategory = category;
//     notifyListeners();
//   }

//   void setDateRange(DateTime? start, DateTime? end) {
//     rangeStart = start;
//     rangeEnd = end;
//     notifyListeners();
//   }

//   void setReportType(bool expense) {
//     isExpense = expense;
//     notifyListeners();
//   }

//   // ───────── SEARCH ─────────
//   void search() {
//     results = HomeMockData.transactions.where((tx) {
//       // type
//       if (isExpense && tx.type != TransactionType.expense) return false;
//       if (!isExpense && tx.type != TransactionType.income) return false;

//       // category
//       if (selectedCategory != null && tx.category != selectedCategory!.name) {
//         return false;
//       }

//       // date
//       if (rangeStart != null && tx.date.isBefore(rangeStart!)) return false;
//       if (rangeEnd != null && tx.date.isAfter(rangeEnd!)) return false;

//       return true;
//     }).toList();

//     notifyListeners();
//   }

//   void clear() {
//     selectedCategory = null;
//     rangeStart = null;
//     rangeEnd = null;
//     isExpense = true;
//     results = [];
//     notifyListeners();
//   }
// }

class SearchFilterController extends ChangeNotifier {
  SearchFilterController() : _allTransactions = HomeMockData.transactions;

  // ───────── SOURCE DATA ─────────
  final List<TransactionModel> _allTransactions;

  // ───────── SEARCH QUERY ─────────
  String _query = '';
  String get query => _query;

  void setQuery(String value) {
    _query = value;
    _applyFilters();
  }

  // ───────── CATEGORY ─────────
  CategoryModel? selectedCategory;
  bool showCategorySelector = false;

  void toggleCategorySelector() {
    showCategorySelector = !showCategorySelector;
    notifyListeners();
  }

  void closeCategorySelector() {
    showCategorySelector = false;
    notifyListeners();
  }

  // ───────── DATE ─────────
  DateTime focusedMonth = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  bool showCalendar = false; // ✅ RESTORED

  void toggleCalendar() {
    showCalendar = !showCalendar;
    notifyListeners();
  }

  void closeCalendar() {
    showCalendar = false;
    notifyListeners();
  }

  void setFocusedMonth(DateTime month) {
    focusedMonth = month;
    notifyListeners();
  }

  // ───────── REPORT TYPE ─────────
  bool isExpense = true;

  void setReportType(bool expense) {
    isExpense = expense;
    _applyFilters();
  }

  // ───────── RESULTS ─────────
  List<TransactionModel> results = [];

  // ───────── FILTER ENGINE ─────────
  void _applyFilters() {
    results = _allTransactions.where((tx) {
      // 🔍 text search
      if (_query.isNotEmpty) {
        final q = _query.toLowerCase();
        if (!tx.title.toLowerCase().contains(q) &&
            !tx.category.toLowerCase().contains(q)) {
          return false;
        }
      }

      // 📊 type
      if (isExpense && tx.type != TransactionType.expense) return false;
      if (!isExpense && tx.type != TransactionType.income) return false;

      // 🏷 category
      if (selectedCategory != null && tx.category != selectedCategory!.name) {
        return false;
      }

      // 📅 date range
      if (rangeStart != null && tx.date.isBefore(rangeStart!)) return false;
      if (rangeEnd != null && tx.date.isAfter(rangeEnd!)) return false;

      return true;
    }).toList();

    notifyListeners();
  }

  // ───────── SETTERS ─────────
  void setCategory(CategoryModel? category) {
    selectedCategory = category;
    _applyFilters();
  }

  void setDateRange(DateTime? start, DateTime? end) {
    rangeStart = start;
    rangeEnd = end;
    _applyFilters();
  }

  // ───────── SEARCH BUTTON ─────────
  void search() {
    _applyFilters();
  }

  // ───────── CLEAR ─────────
  void clear() {
    _query = '';
    selectedCategory = null;
    rangeStart = null;
    rangeEnd = null;
    isExpense = true;
    results = [];
    notifyListeners();
  }
}
