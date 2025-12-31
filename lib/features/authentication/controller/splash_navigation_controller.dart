import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';

class SplashNavigationController extends GetxController {
  bool _isNavigating = false;

  @override
  void onReady() {
    super.onReady();

    if (!_isNavigating) {
      _isNavigating = true;
      _startNavigation();
    }
  }

  Future<void> _startNavigation() async {
    // Wait for splash animation to complete (4.5 seconds)
    await Future.delayed(const Duration(milliseconds: 4500));

    // Double check we haven't been disposed
    if (!Get.isRegistered<SplashNavigationController>()) return;

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAllNamed(TRoutes.home);
    }
    // If no user, stay on current splash screen with login/register buttons
  }

  @override
  void onClose() {
    _isNavigating = false;
    super.onClose();
  }
}
