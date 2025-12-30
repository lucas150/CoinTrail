import 'package:cointrail/features/authentication/screens/login/login_page.dart';
import 'package:cointrail/features/authentication/screens/register/register_page.dart';
import 'package:cointrail/features/authentication/screens/splash/splash_onboarding_screen.dart';
import 'package:cointrail/features/home/screens/home_page.dart';
import 'package:cointrail/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: TRoutes.splashOnboardingScreen,
      page: () => const SplashOnboardingScreen(),
    ),

    GetPage(name: TRoutes.login, page: () => const LoginPage()),

    GetPage(name: TRoutes.register, page: () => const RegisterPage()),

    GetPage(name: TRoutes.home, page: () => HomePage()),
  ];
}
