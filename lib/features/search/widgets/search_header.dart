import 'package:cointrail/common/header/appHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cointrail/features/search/controller/search_filter_controller.dart';
import 'package:cointrail/core_utils/constants/sizes.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SearchFilterController>();

    return AppHeader(
      title: 'Search',
      showBack: true,
      showNotification: true,

      // 🔙 Back clears filters
      onBack: () {
        controller.clear();
        Navigator.maybePop(context);
      },

      // 🔍 Search bar lives in bottom slot
      bottom: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            // const SizedBox(width: TSizes.sm),
            Expanded(
              child: TextField(
                controller: _textController,
                onChanged: controller.setQuery,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search transactions, categories...',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
