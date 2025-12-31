import 'package:flutter/material.dart';

class CategorySpendingModel {
  final String name;
  final double amount;
  final int percentage;
  final Color color;

  const CategorySpendingModel({
    required this.name,
    required this.amount,
    required this.percentage,
    required this.color,
  });
}
