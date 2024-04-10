// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  const CacheHelper._internal();
  static const CacheHelper _instance = CacheHelper._internal(); // singleton
  factory CacheHelper() => _instance;

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    switch (value.runtimeType) {
      case const (String):
        return await _sharedPreferences.setString(key, value);
      case const (int):
        return await _sharedPreferences.setInt(key, value);
      case const (bool):
        return await _sharedPreferences.setBool(key, value);
      case const (double):
        return await _sharedPreferences.setDouble(key, value);
      default:
        return await _sharedPreferences.setString(key, value.toString());
    }
  }

  static dynamic getData({required String key}) {
    final get = _sharedPreferences.get(key);
    return get;
  }

  static Future<bool> removeData({required key}) {
    final remove = _sharedPreferences.remove(key);
    return remove;
  }

  static Future<bool> removeAll() {
    final clear = _sharedPreferences.clear();
    return clear;
  }

  static bool containsKey(String key) {
    final isContainsKey = _sharedPreferences.get(key) == null ? false : true;
    return isContainsKey;
  }
}
