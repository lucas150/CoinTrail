import 'package:cointrail/features/authentication/screens/splash/splash_onboarding_screen.dart';
import 'package:cointrail/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: TRoutes.splashOnboardingScreen,
      page: () => const SplashOnboardingScreen(),
    ),
  ];
}
