import 'dart:convert';

import '../../repository/local_preferences.dart';
import '../model/user_model.dart';

class StorageUserRepository {
  StorageUserRepository() {
    _storage = LocalPreferences();
  }

  late LocalPreferences _storage;

  Future<void> init() async {
    final List<String>? users = await _storage.read('users');
    if (users == null) {
      final user = <String, dynamic>{
        "name": "Johan",
        "lastName": "Hurtado",
        "userName": "Johanl",
        "password": "123",
        "email": "admin@admin.com",
        "description": "I'm the admin",
      };
      await _storage.save('users', [user.toString()]);
    }
  }

  Future<User?> readUserLogged() async {
    final String? userName = await _storage.read<String>('userLogged');
    if (userName == null) {
      return null;
    } else {
      return await readUserByUserName(userName);
    }
  }

  Future<void> saveUserLogged(String userName) async {
    await _storage.save('userLogged', userName);
  }

  Future<void> deleteUserLogged() async {
    await _storage.delete<String>('userLogged');
  }

  Future<void> createUser(String userName, Map<String, dynamic> data) async {
    List<String> stringUsers =
        await _storage.read<List<String>>("users") as List<String>;
    final users = stringUsers
        .map<User?>((stringUser) => User.fromJsonString(stringUser))
        .toList();
    final user = users.firstWhere((user) => user!.userName == userName,
        orElse: () => null);
    if (user == null) {
      stringUsers.add(data.toString());
      await _storage.save("users", users);
    } else {
      return Future.error('User already exists');
    }
  }

  Future<User> readUserByUserName(String userName) async {
    List<String> stringUsers =
        await _storage.read<List<String>>("users") as List<String>;
    final users =
        stringUsers.map<User?>((stringUser) => User.fromJsonString(stringUser));
    final user = users.firstWhere((user) => user!.userName == userName,
        orElse: () => null);
    if (user != null) {
      return user;
    } else {
      return Future.error('User does not exists');
    }
  }

  Future<void> updateUser(String userName, Map<String, dynamic> data) async {
    List<String> stringUsers =
        await _storage.read<List<String>>("users") as List<String>;
    final mapUsers = stringUsers
        .map<Map<String, dynamic>>(
            (stringUser) => json.decode(stringUser) as Map<String, dynamic>)
        .toList();
    final user = mapUsers.firstWhere((user) => user[userName] == userName,
        orElse: () => <String, dynamic>{});
    if (user.isNotEmpty) {
      final index = mapUsers.indexOf(user);
      for (final key in data.keys) {
        user[key] = data[key] ?? user[key];
      }
      stringUsers[index] = user.toString();
      await _storage.save("users", stringUsers);
    } else {
      return Future.error('User does not exists');
    }
  }
}
