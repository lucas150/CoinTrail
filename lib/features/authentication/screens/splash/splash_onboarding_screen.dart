import 'package:cointrail/core_utils/constants/text_strings.dart';
import 'package:cointrail/features/authentication/screens/splash/splash_circle.dart';
import 'package:cointrail/features/authentication/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashOnboardingScreen extends StatefulWidget {
  const SplashOnboardingScreen({super.key});

  @override
  State<SplashOnboardingScreen> createState() => _SplashOnboardingScreenState();
}

class _SplashOnboardingScreenState extends State<SplashOnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final SplashController splash;

  @override
  void initState() {
    super.initState();
    splash = SplashController(this)..start();
  }

  @override
  void dispose() {
    splash.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: splash.backgroundColor.value, // Use animated background
      body: AnimatedBuilder(
        animation: splash.controller,
        builder: (context, _) {
          // Switch text color when circle is big
          final bool showOnPrimaryText = splash.circleRadius.value > 90;

          return Stack(
            children: [
              /// Animated circle
              SplashCircle(
                positionFromTop: splash.circlePosition.value,
                radius: splash.circleRadius.value,
                // 👇 pass theme color instead of constant
                color: colorScheme.primary,
              ),

              /// App name text
              Center(
                child: Opacity(
                  opacity: splash.contentOpacity.value,
                  child: Text(
                    TTexts.appName,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: showOnPrimaryText
                          ? colorScheme.onPrimary
                          : colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
