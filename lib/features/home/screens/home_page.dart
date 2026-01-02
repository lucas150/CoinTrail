import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:cointrail/features/home/widgets/carousel_card/home_balance_carousel.dart';
import 'package:cointrail/features/home/widgets/header/home_header.dart';
import 'package:cointrail/features/home/widgets/chart/spending_by_category_section.dart';
import 'package:cointrail/features/home/widgets/recent_transaction/recent_transactions_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ─────────────────────────
            // HEADER + CAROUSEL OVERLAP
            // ─────────────────────────
            SliverToBoxAdapter(
              child: SizedBox(
                height:
                    370, // Enough space for header (180) + carousel (200) with overlap
                child: Stack(
                  children: [
                    // Header
                    const HomeHeader(),
                    // Carousel positioned to overlap
                    Positioned(
                      top: 150, // Position it to overlap with header's curve
                      left: 0,
                      right: 0,
                      child: const HomeBalanceCarousel(),
                    ),
                  ],
                ),
              ),
            ),

            // ─────────────────────────
            // CONTENT CARD
            // ─────────────────────────
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(
                  TSizes.md,
                  TSizes.xl, // Add more top margin to account for carousel
                  TSizes.md,
                  TSizes.xl,
                ),
                padding: const EdgeInsets.all(TSizes.lg),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SpendingByCategorySection(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    RecentTransactionsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
