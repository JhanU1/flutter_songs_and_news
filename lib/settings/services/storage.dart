import 'dart:convert';

import 'package:platform_design/repository/local_preferences.dart';
import 'package:platform_design/settings/model/setting_model.dart';

import '../../user/model/user_model.dart';
import '../../user/services/auth.dart';

class StorageSettings {
  // singleton
  static final StorageSettings _instance = StorageSettings._internal();

  factory StorageSettings() {
    return _instance;
  }

  StorageSettings._internal();

  final LocalPreferences _storage = LocalPreferences();
  List<String>? _settings;
  final AuthenticationService _auth = AuthenticationService();
  User? user;
  List<String> get settings => _settings ?? [];

  String? pathName() {
    if (user != null) {
      return 'settings-${user!.userName}';
    } else {
      return null;
    }
  }

  Future<void> init() async {
    user = await _auth.readUserLogged();
    final List<String> defaultSettings = Setting.defaultSettings()
        .map<String>((setting) => jsonEncode(setting.toJson()))
        .toList();
    if (pathName() != null) {
      final List<String>? settings = await _storage.read(pathName()!);
      if (settings == null) {
        await _storage.save(pathName()!, defaultSettings);
        _settings = defaultSettings;
      } else {
        _settings = settings;
      }
    }
  }

  Future<void> updateSetting(Setting setting) async {
    final settingF = _settings!.firstWhere(
        (element) => Setting.fromJsonString(element).title == setting.title);
    final indexOfSetting = _settings!.indexOf(settingF);
    _settings![indexOfSetting] = jsonEncode(setting.toJson());
    await _storage.save(pathName()!, _settings);
  }
}
