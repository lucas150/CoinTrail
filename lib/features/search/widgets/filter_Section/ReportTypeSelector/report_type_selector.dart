import 'package:cointrail/features/search/widgets/helper_widgets/filter_shared_widgets.dart';
import 'package:flutter/material.dart';

class ReportTypeSelector extends StatelessWidget {
  final bool isExpense;
  final ValueChanged<bool> onChanged;

  const ReportTypeSelector({
    super.key,
    required this.isExpense,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterLabel('Report'),
        const SizedBox(height: 12),
        Row(
          children: [
            FilterRadio(
              label: 'Income',
              selected: !isExpense,
              onTap: () => onChanged(false),
            ),
            const SizedBox(width: 24),
            FilterRadio(
              label: 'Expense',
              selected: isExpense,
              onTap: () => onChanged(true),
            ),
          ],
        ),
      ],
    );
  }
}
