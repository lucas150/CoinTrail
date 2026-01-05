import 'package:flutter/material.dart';
import 'package:cointrail/core_utils/constants/sizes.dart';

// class IncomeExpenseToggleMinimal extends StatelessWidget {
//   const IncomeExpenseToggleMinimal({
//     super.key,
//     required this.isIncome,
//     required this.onChanged,
//   });

//   final bool isIncome;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;

//     return Container(
//       height: 48,
//       decoration: BoxDecoration(
//         color: colors.surfaceContainerHighest,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Row(
//         children: [
//           _Item(
//             label: 'Income',
//             selected: isIncome,
//             onTap: () => onChanged(true),
//           ),
//           _Item(
//             label: 'Expense',
//             selected: !isIncome,
//             onTap: () => onChanged(false),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Item extends StatelessWidget {
//   const _Item({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });

//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;

//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           margin: const EdgeInsets.all(4),
//           decoration: BoxDecoration(
//             color: selected ? colors.primary : Colors.transparent,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: selected
//                     ? colors.onPrimary
//                     : colors.onSurface.withOpacity(0.6),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class IncomeExpenseToggleMinimal extends StatelessWidget {
  const IncomeExpenseToggleMinimal({
    super.key,
    required this.isIncome,
    required this.onChanged,
  });

  final bool isIncome;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Card(
          label: 'Income',
          color: Colors.green,
          selected: isIncome,
          onTap: () => onChanged(true),
        ),
        const SizedBox(width: 12),
        _Card(
          label: 'Expense',
          color: Colors.red,
          selected: !isIncome,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.label,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: TSizes.xxl,
          decoration: BoxDecoration(
            color: selected ? color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? color : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? color : Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class IncomeExpenseToggleMinimal extends StatelessWidget {
//   const IncomeExpenseToggleMinimal({
//     super.key,
//     required this.isIncome,
//     required this.onChanged,
//   });

//   final bool isIncome;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         _IconItem(
//           icon: Icons.trending_up,
//           label: 'Income',
//           selected: isIncome,
//           color: Colors.green,
//           onTap: () => onChanged(true),
//         ),
//         const SizedBox(width: 16),
//         _IconItem(
//           icon: Icons.trending_down,
//           label: 'Expense',
//           selected: !isIncome,
//           color: Colors.red,
//           onTap: () => onChanged(false),
//         ),
//       ],
//     );
//   }
// }

// class _IconItem extends StatelessWidget {
//   const _IconItem({
//     required this.icon,
//     required this.label,
//     required this.selected,
//     required this.color,
//     required this.onTap,
//   });

//   final IconData icon;
//   final String label;
//   final bool selected;
//   final Color color;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           height: 60,
//           decoration: BoxDecoration(
//             color: selected ? color.withOpacity(0.15) : Colors.transparent,
//             borderRadius: BorderRadius.circular(18),
//             border: Border.all(color: selected ? color : Colors.grey.shade300),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: selected ? color : Colors.grey),
//               const SizedBox(height: 4),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: selected ? color : Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
