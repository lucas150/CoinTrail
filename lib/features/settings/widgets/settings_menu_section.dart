import 'package:flutter/material.dart';
import 'package:cointrail/features/settings/widgets/common/settings_card.dart';

class SettingsMenuSection extends StatelessWidget {
  const SettingsMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SettingsMenuTile(icon: Icons.lock, title: 'Security & Privacy'),
      ],
    );
  }
}

class SettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsMenuTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
