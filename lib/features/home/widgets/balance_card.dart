import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance',
                style: TextStyle(color: colors.onPrimary.withOpacity(0.8)),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${controller.balance.value.toStringAsFixed(2)}',
                style: TextStyle(
                  color: colors.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
