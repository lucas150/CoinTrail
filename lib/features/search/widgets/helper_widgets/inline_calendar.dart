// TODO: Improve the inline calendar UI/UX later make year and month inline

import 'package:flutter/material.dart';
import 'package:cointrail/core_utils/constants/sizes.dart';

class InlineCalendar extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final ValueChanged<DateTime> onMonthChanged;
  final ValueChanged<DateTime> onDaySelected;

  const InlineCalendar({
    super.key,
    required this.focusedMonth,
    required this.rangeStart,
    required this.rangeEnd,
    required this.onMonthChanged,
    required this.onDaySelected,
  });

  String _monthName(int m) => const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ][m - 1];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final firstDay = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedMonth.year,
      focusedMonth.month,
    );
    final offset = firstDay.weekday % 7;

    return Container(
      // margin: const EdgeInsets.only(top: TSizes.md),
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<int>(
                value: focusedMonth.month,
                underline: const SizedBox(),
                items: List.generate(
                  12,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Text(_monthName(i + 1)),
                  ),
                ),
                onChanged: (v) =>
                    onMonthChanged(DateTime(focusedMonth.year, v!)),
              ),
              DropdownButton<int>(
                value: focusedMonth.year,
                underline: const SizedBox(),
                items: List.generate(5, (i) {
                  final year = DateTime.now().year - 2 + i;
                  return DropdownMenuItem(value: year, child: Text('$year'));
                }),
                onChanged: (v) =>
                    onMonthChanged(DateTime(v!, focusedMonth.month)),
              ),
            ],
          ),

          // const SizedBox(height: TSizes.sm),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: daysInMonth + offset,
            itemBuilder: (_, i) {
              if (i < offset) return const SizedBox();
              final day = i - offset + 1;
              final date = DateTime(focusedMonth.year, focusedMonth.month, day);

              final isStart =
                  rangeStart != null && DateUtils.isSameDay(date, rangeStart);
              final isEnd =
                  rangeEnd != null && DateUtils.isSameDay(date, rangeEnd);
              final inRange =
                  rangeStart != null &&
                  rangeEnd != null &&
                  date.isAfter(rangeStart!) &&
                  date.isBefore(rangeEnd!);

              return GestureDetector(
                onTap: () => onDaySelected(date),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isStart || isEnd
                        ? colors.primary
                        : inRange
                        ? colors.primary.withValues(alpha: 0.2)
                        : null,
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isStart || isEnd
                          ? colors.onPrimary
                          : colors.onSurface,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
