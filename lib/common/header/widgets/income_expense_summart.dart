import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class IncomeExpenseSummary extends StatelessWidget {
  const IncomeExpenseSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        // Expanded(
        //   child: _SummaryCard(label: 'Income', amount: '₹24,000'),
        // ),
        SizedBox(width: TSizes.sm),
        // Expanded(
        //   child: _SummaryCard(label: 'Expense', amount: '₹18,500'),
        // ),
      ],
    );
  }
}
