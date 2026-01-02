import 'package:cointrail/core_utils/theme/theme.dart';
import 'package:cointrail/features/authentication/screens/splash/splash_onboarding_screen.dart';
import 'package:cointrail/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// -- README(Docs[3]) -- Bindings
      title: "Starter Template",
      // initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.light,
      darkTheme: TAppTheme.dark,
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,

      // 👇 TEMPORARY FOR TESTING
      // initialRoute: TRoutes.home,
      getPages: AppRoutes.pages,

      home: const SplashOnboardingScreen(),
    );
  }
}
