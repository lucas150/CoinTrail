import 'package:cointrail/features/authentication/screens/splash/splash_onboarding_screen.dart';
import 'package:cointrail/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: TRoutes.splash_onboarding_screen,
      page: () => const SplashOnboardingScreen(),
    ),
  ];
}
