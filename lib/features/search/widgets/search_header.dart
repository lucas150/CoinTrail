import 'package:flutter/material.dart';
import 'package:cointrail/core_utils/constants/sizes.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final mediaQuery = MediaQuery.of(context);
    final statusBarHeight = mediaQuery.padding.top;

    return SizedBox(
      height: 220 + statusBarHeight, // add status bar height
      child: Stack(
        children: [
          // ----------------------------------
          // PRIMARY BACKGROUND
          // ----------------------------------
          Container(
            height: 170 + statusBarHeight,
            width: double.infinity,
            color: colors.primary,
          ),

          // ----------------------------------
          // WHITE CURVED CUTOUT
          // ----------------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(48),
                ),
              ),
            ),
          ),

          // ----------------------------------
          // CONTENT
          // ----------------------------------
          Padding(
            padding: EdgeInsets.fromLTRB(
              TSizes.lg,
              TSizes.lg + statusBarHeight,
              TSizes.lg,
              TSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -----------------------------
                // TOP ROW
                // -----------------------------
                Row(
                  children: [
                    // Back
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: colors.onPrimary,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: TSizes.sm),

                    // Title
                    Expanded(
                      child: Text(
                        'Search',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colors.onPrimary,
                        ),
                      ),
                    ),

                    // Notification
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colors.onPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {},
                        child: Icon(
                          Icons.notifications_rounded,
                          color: colors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: TSizes.lg),

                // -----------------------------
                // SEARCH BAR
                // -----------------------------
                Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: TSizes.sm),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search transactions, categories...',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: colors.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
