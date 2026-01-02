// import 'package:cointrail/features/search/controller/search_filter_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:cointrail/core_utils/constants/sizes.dart';
// import 'package:provider/provider.dart';

// class SearchHeader extends StatefulWidget {
//   const SearchHeader({super.key});

//   @override
//   State<SearchHeader> createState() => _SearchHeaderState();
// }

// class _SearchHeaderState extends State<SearchHeader> {
//   late final TextEditingController _textController;

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final mediaQuery = MediaQuery.of(context);
//     final statusBarHeight = mediaQuery.padding.top;

//     final searchController = context.read<SearchFilterController>();

//     return SizedBox(
//       height: 220 + statusBarHeight, // add status bar height
//       child: Stack(
//         children: [
//           // ----------------------------------
//           // PRIMARY BACKGROUND
//           // ----------------------------------
//           Container(
//             height: 170 + statusBarHeight,
//             width: double.infinity,
//             color: colors.primary,
//           ),

//           // ----------------------------------
//           // WHITE CURVED CUTOUT
//           // ----------------------------------
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 80,
//               decoration: BoxDecoration(
//                 color: colors.surface,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(48),
//                 ),
//               ),
//             ),
//           ),

//           // ----------------------------------
//           // CONTENT
//           // ----------------------------------
//           Padding(
//             padding: EdgeInsets.fromLTRB(
//               TSizes.lg,
//               TSizes.lg + statusBarHeight,
//               TSizes.lg,
//               TSizes.md,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // -----------------------------
//                 // TOP ROW
//                 // -----------------------------
//                 Row(
//                   children: [
//                     // Back
//                     InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: () {
//                         context.read<SearchFilterController>().clear();
//                         Navigator.maybePop(context);
//                       },
//                       child: Icon(
//                         Icons.arrow_back_rounded,
//                         color: colors.onPrimary,
//                         size: 28,
//                       ),
//                     ),

//                     const SizedBox(width: TSizes.sm),

//                     // Title
//                     Expanded(
//                       child: Text(
//                         'Search',
//                         style: theme.textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.w800,
//                           color: colors.onPrimary,
//                         ),
//                       ),
//                     ),

//                     // Notification
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: colors.onPrimary,
//                         shape: BoxShape.circle,
//                       ),
//                       child: InkWell(
//                         customBorder: const CircleBorder(),
//                         onTap: () {},
//                         child: Icon(
//                           Icons.notifications_rounded,
//                           color: colors.primary,
//                           size: 22,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: TSizes.lg),

//                 // -----------------------------
//                 // SEARCH BAR
//                 // -----------------------------
//                 Container(
//                   height: 48,
//                   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
//                   decoration: BoxDecoration(
//                     color: colors.surface,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.search,
//                         color: colors.onSurface.withOpacity(0.6),
//                       ),
//                       const SizedBox(width: TSizes.sm),
//                       Expanded(
//                         child: TextField(
//                           controller: _textController,
//                           onChanged: searchController.setQuery,
//                           decoration: InputDecoration(
//                             hintText: 'Search transactions, categories...',
//                             border: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             disabledBorder: InputBorder.none,
//                             errorBorder: InputBorder.none,
//                             focusedErrorBorder: InputBorder.none,
//                             hintStyle: theme.textTheme.bodyMedium?.copyWith(
//                               color: colors.onSurface.withOpacity(0.5),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
