import 'package:platform_design/repository/local_preferences.dart';

import '../model/user_model.dart';
import 'auth.dart';

class StoragePreference {
  // singleton
  static final StoragePreference _instance = StoragePreference._internal();

  factory StoragePreference() {
    return _instance;
  }

  StoragePreference._internal();

  final LocalPreferences _storage = LocalPreferences();
  List<String>? _preferences;
  final AuthenticationService _auth = AuthenticationService();
  User? user;
  List<String> get preferences => _preferences ?? [];

  String? pathName() {
    if (user != null) {
      return 'preferences-${user!.userName}';
    } else {
      return null;
    }
  }

  Future<void> init() async {
    user = await _auth.readUserLogged();
    final List<String> defaultPreferences = [
      'Dial it to 11',
      'Basking in sunlight'
    ];
    if (pathName() != null) {
      final List<String>? preferences =
          await _storage.read<List>(pathName()!) as List<String>?;
      if (preferences == null) {
        await _storage.save<List>(pathName()!, defaultPreferences);
        _preferences = defaultPreferences;
      } else {
        _preferences = preferences;
      }
    }
  }

  Future<void> setIntensity(String preference) async {
    _preferences![0] = preference;
    await _storage.save<List>(pathName()!, _preferences!);
  }

  Future<void> setMood(String preference) async {
    _preferences![1] = preference;
    await _storage.save<List>(pathName()!, _preferences!);
  }
}
