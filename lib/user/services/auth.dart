import '../model/user_model.dart';
import 'storage.dart';

class AuthenticationRepository {
  AuthenticationRepository() {
    _storage = StorageUserRepository();
  }

  late StorageUserRepository _storage;

  Future<User> loginUser(String username, String password) async {
    try {
      final user = await _storage.readUserByUserName(username);
      if (user.password == password) {
        await _storage.saveUserLogged(username);
        return user;
      } else {
        return Future.error('Password is incorrect');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> logoutUser() async {
    await _storage.deleteUserLogged();
  }

  Future<User> registerUser(String username, Map<String, dynamic> data) async {
    try {
      final user = await _storage.readUserByUserName(username);
      await _storage.createUser(username, data);
      return user;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<User> updateUser(String username, Map<String, dynamic> data) async {
    try {
      final user = await _storage.readUserByUserName(username);
      await _storage.updateUser(username, data);
      return user;
    } catch (e) {
      return Future.error(e);
    }
  }
}
