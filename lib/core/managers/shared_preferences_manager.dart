import "package:shared_preferences/shared_preferences.dart";
import 'package:calendar/core/di/di.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._init();

  static SharedPreferencesManager get instance => _instance;
  SharedPreferences? _preferences;

  SharedPreferencesManager._init() {
    _preferences = getIt<SharedPreferences>();
  }

  Future<void> preferencesInit() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> set(String key, dynamic value) async {
    switch (value.runtimeType) {
      case String:
        return _preferences!.setString(key, value as String);
      case bool:
        return _preferences!.setBool(key, value as bool);
      case int:
        return _preferences!.setInt(key, value as int);
      case double:
        return _preferences!.setDouble(key, value as double);
      case (List<String>):
        return _preferences!.setStringList(key, value as List<String>);
      default:
        return false;
    }
  }

  Future<dynamic> get(Type type, String key) async {
    switch (type) {
      case String:
        return _preferences!.getString(key);
      case bool:
        return _preferences!.getBool(key);
      case int:
        return _preferences!.getInt(key);
      case double:
        return _preferences!.getDouble(key);
      case (List<String>):
        return _preferences!.getStringList(key);
      default:
        return null;
    }
  }

  Future<void> removeValue(String key) async {
    await _preferences!.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }
}
