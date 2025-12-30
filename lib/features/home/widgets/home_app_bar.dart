import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('CoinTrail'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // later: FirebaseAuth.instance.signOut();
            Get.offAllNamed(TRoutes.login);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
