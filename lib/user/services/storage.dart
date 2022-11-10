import 'dart:convert';

import '../../repository/local_preferences.dart';
import '../model/user_model.dart';

class StorageUser {
//singleton
  static final StorageUser _instance = StorageUser._internal();

  factory StorageUser() {
    return _instance;
  }
  StorageUser._internal();

  final LocalPreferences _storage = LocalPreferences();

  Future<void> init() async {
    //  await _storage.delete<List>("users");
    final List<String>? users =
        await _storage.read<List>('users') as List<String>?;
    if (users == null) {
      final user = <String, dynamic>{
        "name": "Johan",
        "lastName": "Hurtado",
        "userName": "Johanl",
        "password": "123",
        "description": "I'm the admin",
      };
      await _storage.save<List>('users', <String>[jsonEncode(user)]);
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
    await _storage.save<String>('userLogged', userName);
  }

  Future<void> deleteUserLogged() async {
    await _storage.delete<String>('userLogged');
  }

  Future<void> createUser(String userName, Map<String, dynamic> data) async {
    List<String> stringUsers =
        await _storage.read<List>("users") as List<String>;
    final users = stringUsers
        .map<User?>((stringUser) => User.fromJsonString(stringUser))
        .toList();
    final user = users.firstWhere((user) => user!.userName == userName,
        orElse: () => null);
    if (user == null) {
      stringUsers.add(jsonEncode(data));
      await _storage.save<List>("users", stringUsers);
    } else {
      return Future.error('User already exists');
    }
  }

  Future<User> readUserByUserName(String userName) async {
    List<String> stringUsers =
        await _storage.read<List>("users") as List<String>;
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
        await _storage.read<List>("users") as List<String>;
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
      stringUsers[index] = jsonEncode(user);
      await _storage.save<List>("users", stringUsers);
    } else {
      return Future.error('User does not exists');
    }
  }
}
