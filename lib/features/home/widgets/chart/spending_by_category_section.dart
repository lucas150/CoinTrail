import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:cointrail/features/home/controller/home_controller.dart';
import 'package:cointrail/features/home/widgets/chart/category_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_row.dart';

class SpendingByCategorySection extends StatelessWidget {
  const SpendingByCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final categories = controller.categories;
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(TSizes.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Spending by Category',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('January 2025'),
              ),
            ],
          ),

          const SizedBox(height: TSizes.lg),

          Row(
            children: [
              // Pie Chart
              const SizedBox(
                width: 130,
                height: 130,
                child: CategoryPieChart(),
              ),

              const SizedBox(width: TSizes.lg),

              // Category List
              Expanded(
                child: Column(
                  children: categories
                      .map<Widget>(
                        (category) => CategoryRow(
                          title: category.name,
                          amount: category.amount,
                          percent: category.percentage,
                          indicatorColor: category.color,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
