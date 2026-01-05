import 'package:cointrail/features/settings/controller/settings_controller.dart';
import 'package:cointrail/features/settings/widgets/common/Settings_label.dart';
import 'package:cointrail/features/settings/widgets/common/settings_soft_text_field.dart';
import 'package:flutter/material.dart';
import 'package:cointrail/features/settings/widgets/common/settings_card.dart';

class ProfileSection extends StatelessWidget {
  final SettingsController controller;

  const ProfileSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return SettingsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Profile',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),

                  /// Fields
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Settings_label('Full Name'),
                        Settings_SoftTextField(
                          controller: controller.nameController,
                          onChanged: controller.updateName,
                        ),
                        const SizedBox(height: 14),
                        Settings_label('Monthly Budget'),
                        Settings_SoftTextField(
                          controller: controller.budgetController,
                          keyboardType: TextInputType.number,
                          onChanged: controller.updateBudget,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
