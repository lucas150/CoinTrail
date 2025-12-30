import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome To',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: colors.onPrimary),
          ),
          Text(
            'CoinTrail',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Where your expenses find their home',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: colors.onPrimary.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
