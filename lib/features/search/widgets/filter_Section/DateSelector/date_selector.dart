import 'package:cointrail/features/search/widgets/helper_widgets/filter_shared_widgets.dart';
import 'package:cointrail/features/search/widgets/helper_widgets/inline_calendar.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final bool showCalendar;

  final VoidCallback onToggle;
  final ValueChanged<DateTime> onMonthChanged;
  final void Function(DateTime) onDaySelected;

  const DateSelector({
    super.key,
    required this.focusedMonth,
    required this.rangeStart,
    required this.rangeEnd,
    required this.showCalendar,
    required this.onToggle,
    required this.onMonthChanged,
    required this.onDaySelected,
  });

  String get label {
    if (rangeStart == null) return 'Select date';
    if (rangeEnd == null) return _fmt(rangeStart!);
    return '${_fmt(rangeStart!)} - ${_fmt(rangeEnd!)}';
  }

  static String _fmt(DateTime d) => '${d.day}/${d.month}/${d.year}';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterLabel('Date'),
        const SizedBox(height: 8),

        GestureDetector(
          onTap: onToggle,
          child: FilterPill(
            text: label,
            icon: Icons.calendar_month_rounded,
            iconBg: colors.primary.withValues(alpha: 0.15),
            iconColor: colors.primary,
          ),
        ),

        if (showCalendar)
          InlineCalendar(
            focusedMonth: focusedMonth,
            rangeStart: rangeStart,
            rangeEnd: rangeEnd,
            onMonthChanged: onMonthChanged,
            onDaySelected: onDaySelected,
          ),
      ],
    );
  }
}
