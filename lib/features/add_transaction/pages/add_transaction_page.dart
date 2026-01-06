// lib/features/add_transaction/pages/add_transaction_page.dart

import 'package:cointrail/common/header/appHeader.dart';
import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:cointrail/features/add_transaction/widgets/category/category_selector.dart';
import 'package:cointrail/features/add_transaction/widgets/date_picker.dart';
import 'package:cointrail/features/add_transaction/widgets/income_expense_toggle.dart';
import 'package:cointrail/features/add_transaction/widgets/input_field.dart';
import 'package:cointrail/features/add_transaction/widgets/payment_mode_selector.dart';
import 'package:cointrail/features/add_transaction/widgets/scan_receipt_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/add_transaction_controller.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddTransactionController(),
      child: const _AddTransactionView(),
    );
  }
}

class _AddTransactionView extends StatelessWidget {
  const _AddTransactionView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final controller = context.watch<AddTransactionController>();

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppHeader is already a sliver, don't wrap it in SliverToBoxAdapter
            AppHeader(
              title: 'Add Transaction',
              showBack: true,

              bottom_analysis: DatePicker(controller: controller),
              extendedHeight: true,
            ),
            // ───────── FORM CONTENT ─────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(TSizes.lg, 0, TSizes.lg, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 🔁 Income / Expense
                    IncomeExpenseToggleMinimal(
                      isIncome: controller.isIncome,
                      onChanged: controller.toggleType,
                    ),

                    const SizedBox(height: 20),

                    // 📝 Title
                    InputField(
                      label: controller.isIncome
                          ? 'Income Title'
                          : 'Expense Title',
                      controller: controller.titleController,
                    ),

                    const SizedBox(height: 16),

                    // 💰 Amount
                    InputField(
                      label: 'Amount',
                      controller: controller.amountController,
                      keyboardType: TextInputType.number,
                      // prefix: const Text('₹'),
                    ),

                    const SizedBox(height: 20),

                    // 🏷 Category
                    CategorySelector(
                      selectedCategoryId: controller.selectedCategory?.id,
                      isIncome: controller.isIncome,
                      onSelected: controller.setCategory,
                    ),

                    const SizedBox(height: 20),

                    // 📷 Scan Receipt
                    Row(
                      children: [
                        Expanded(
                          child: ScanReceiptField(
                            receiptPath: controller.receiptPath,
                            onTap: () {
                              controller.setReceipt('mock/receipt/path.jpg');
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PaymentModeField(
                            selected: controller.paymentMode,
                            onTap: () {
                              // navigate to payment mode page
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 🗒 Notes
                    InputField(
                      label: 'Notes (Optional)',
                      controller: controller.noteController,
                      maxLines: 3,
                    ),

                    const SizedBox(height: 20),

                    // ✅ Submit
                    SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          final tx = controller.createTransaction();
                          Navigator.pop(context, tx);
                        },
                        child: Text(
                          controller.isIncome ? 'ADD INCOME' : 'ADD EXPENSE',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
