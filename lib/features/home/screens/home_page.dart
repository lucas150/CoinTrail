import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:cointrail/features/home/widgets/carousel_card/home_balance_carousel.dart';
import 'package:cointrail/features/navbar/nav_bar.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------------
              // HEADER (fixed)
              // ----------------------
              const HomeHeader(),

              // ----------------------
              // CAROUSEL (lift up)
              // ----------------------
              Transform.translate(
                offset: const Offset(0, -TSizes.lg), // 👈 closer to header
                child: const HomeBalanceCarousel(),
              ),

              // ----------------------
              // CONTENT CARD (lift up more)
              // ----------------------
              Transform.translate(
                offset: const Offset(0, -TSizes.lg),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: TSizes.md),
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
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
