import 'package:get/get.dart';

import '../../profile/services/storage.dart';
import '../../settings/services/storage.dart';
import '../model/user_model.dart';
import '../services/auth.dart';

class UserController extends GetxController {
  UserController() {
    init();
  }
  Rx<User?> currentUser = Rx(null);

  final AuthenticationService _authenticationService = AuthenticationService();
  final StorageSettings _storageSettings = StorageSettings();
  final StoragePreference _storagePreference = StoragePreference();

  Future<void> init() async {
    await _authenticationService.init();
    try {
      final user = await _authenticationService.readUserLogged();
      currentUser.value = user;
      await _storageSettings.init();
      await _storagePreference.init();
    } catch (e) {
      currentUser.value = null;
    }
  }

  Future<void> register({
    required String name,
    required String lastName,
    required String userName,
    required String password,
    String description = "",
  }) async {
    try {
      await _authenticationService.registerUser(userName, <String, dynamic>{
        'name': name,
        'lastName': lastName,
        'userName': userName,
        'password': password,
        'description': description,
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    try {
      await _authenticationService.loginUser(userName, password);
      final user = await _authenticationService.readUserLogged();
      currentUser.value = user;
      await _storageSettings.init();
      await _storagePreference.init();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> logout() async {
    try {
      await _authenticationService.logoutUser();
      currentUser.value = null;
    } catch (e) {
      return Future.error(e);
    }
  }
}
