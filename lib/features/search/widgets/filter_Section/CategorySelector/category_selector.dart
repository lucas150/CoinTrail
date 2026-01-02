import 'package:cointrail/features/search/widgets/helper_widgets/filter_shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cointrail/data/mock/category_mock_data.dart';
import 'package:cointrail/data/models/category_model.dart';
import 'package:cointrail/features/search/controller/search_filter_controller.dart';

class CategorySelector extends StatelessWidget {
  final CategoryModel? selectedCategory;
  final ValueChanged<CategoryModel?> onSelected;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterController>(
      builder: (context, controller, child) {
        final colors = Theme.of(context).colorScheme;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilterLabel('Category'),
            const SizedBox(height: 8),

            GestureDetector(
              onTap: controller.toggleCategorySelector,
              child: FilterPill(
                text: selectedCategory?.name ?? 'All categories',
                icon: Icons.keyboard_arrow_down_rounded,
              ),
            ),

            if (controller.showCategorySelector)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: CategoryMockData.all.map((cat) {
                    final selected = selectedCategory?.id == cat.id;

                    return GestureDetector(
                      onTap: () {
                        onSelected(cat);
                        controller.closeCategorySelector();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? cat.color.withValues(alpha: 0.2)
                              : colors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(cat.icon, size: 16, color: cat.color),
                            const SizedBox(width: 6),
                            Text(cat.name),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
