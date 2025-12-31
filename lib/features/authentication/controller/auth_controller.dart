import 'package:cointrail/routes/routes.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final _repo = AuthRepository();

  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxBool loading = false.obs;

  Future<void> register(String email, String password, String username) async {
    try {
      loading.value = true;
      user.value = await _repo.register(
        email: email,
        password: password,
        username: username,
      );
      Get.toNamed(TRoutes.home);
    } finally {
      loading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      loading.value = true;
      user.value = await _repo.login(email: email, password: password);
      Get.toNamed(TRoutes.home);
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> loadCachedUser() async {
    user.value = await _repo.getCachedUser();
  }

  Future<void> logout() async {
    await _repo.logout();
    user.value = null;
  }
}
