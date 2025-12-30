import 'package:hive/hive.dart';
import '../../models/user_model.dart';

class UserHiveSource {
  static const _boxName = 'userBox';

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox(_boxName);
    await box.put('user', user.toMap());
  }

  Future<UserModel?> getUser() async {
    final box = await Hive.openBox(_boxName);
    final data = box.get('user');
    if (data == null) return null;
    return UserModel.fromMap(Map<String, dynamic>.from(data));
  }

  Future<void> clear() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
