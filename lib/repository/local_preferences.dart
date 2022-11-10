import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
// Singleton
  static final LocalPreferences _instance = LocalPreferences._internal();

  factory LocalPreferences() {
    return _instance;
  }

  LocalPreferences._internal();

  Future<T?> read<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic value;
    switch (T) {
      case bool:
        value = prefs.getBool(key);
        break;
      case double:
        value = prefs.getDouble(key);
        break;
      case int:
        value = prefs.getInt(key);
        break;
      case String:
        value = prefs.getString(key);
        break;
      case List:
        value = prefs.getStringList(key);
        break;
    }
    return value as T?;
  }

  Future<void> save<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case String:
        await prefs.setString(key, value as String);
        break;
      case List:
        await prefs.setStringList(key, value as List<String>);
        break;
    }
  }

  Future<void> delete<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
