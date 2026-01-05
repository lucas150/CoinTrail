import 'package:cointrail/data/models/category_model.dart';
import 'package:cointrail/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

class AddTransactionController extends ChangeNotifier {
  // ───────── TYPE ─────────
  TransactionType type = TransactionType.income;

  bool get isIncome => type == TransactionType.income;

  void toggleType(bool income) {
    type = income ? TransactionType.income : TransactionType.expense;
    selectedCategory = null; // reset category when switching
    notifyListeners();
  }

  // ───────── DATE ─────────
  DateTime selectedDate = DateTime.now();

  void changeMonth(int offset) {
    final newMonth = DateTime(
      selectedDate.year,
      selectedDate.month + offset,
      1,
    );

    if (newMonth.isAfter(DateTime.now())) return;

    selectedDate = newMonth;
    notifyListeners();
  }

  void changeWeek(int offset) {
    final next = selectedDate.add(Duration(days: 7 * offset));
    if (next.isAfter(DateTime.now())) return;

    selectedDate = next;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  // ───────── CATEGORY ─────────
  CategoryModel? selectedCategory;

  void setCategory(CategoryModel category) {
    selectedCategory = category;
    notifyListeners();
  }

  // ───────── PAYMENT ─────────
  PaymentMode paymentMode = PaymentMode.cash;

  void setPaymentMode(PaymentMode mode) {
    paymentMode = mode;
    notifyListeners();
  }

  // ───────── INPUTS ─────────
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final noteController = TextEditingController();

  String? receiptPath;

  void setReceipt(String path) {
    receiptPath = path;
    notifyListeners();
  }

  // ───────── CREATE TRANSACTION ─────────
  TransactionModel createTransaction() {
    return TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleController.text.trim(),
      type: type,
      amount: double.parse(amountController.text),
      category: selectedCategory?.name ?? '',
      date: selectedDate,
      paymentMode: paymentMode,
      note: noteController.text.isEmpty ? null : noteController.text,
      receiptPath: receiptPath,
    );
  }
}
