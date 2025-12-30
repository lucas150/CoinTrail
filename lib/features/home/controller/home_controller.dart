import 'package:get/get.dart';

class HomeController extends GetxController {
  final balance = 0.0.obs;
  final income = 0.0.obs;
  final expense = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // Later:
    // loadFromHive();
  }
}
