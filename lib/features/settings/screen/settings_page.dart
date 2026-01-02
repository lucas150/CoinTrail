import 'package:cointrail/common/header/appHeader.dart' show AppHeader;
import 'package:cointrail/common/header/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            title: 'Settings',
            showBack: true,
            showNotification: true,
            centerWidget: const ProfileAvatar(
              imageUrl: 'https://i.pravatar.cc/300',
              name: 'John Smith',
              userId: '25030024',
            ),
          ),
          const Expanded(
            child: Center(child: Text('Settings Content Goes Here')),
          ),
        ],
      ),
    );
  }
}
