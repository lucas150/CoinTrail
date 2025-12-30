import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_transactions.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            BalanceCard(),
            SizedBox(height: 16),
            QuickActions(),
            SizedBox(height: 24),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
