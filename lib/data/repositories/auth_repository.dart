import '../models/user_model.dart';
import '../sources/local/user_hive_source.dart';
import '../sources/remote/auth_firebase_source.dart';

class AuthRepository {
  final _remote = AuthFirebaseSource();
  final _local = UserHiveSource();

  Future<UserModel> register({
    required String email,
    required String password,
    required String username,
  }) async {
    final user = await _remote.register(
      email: email,
      password: password,
      username: username,
    );
    await _local.saveUser(user);
    return user;
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final user = await _remote.login(email: email, password: password);
    await _local.saveUser(user);
    return user;
  }

  Future<UserModel?> getCachedUser() {
    return _local.getUser();
  }

  Future<void> logout() async {
    await _remote.logout();
    await _local.clear();
  }
}
