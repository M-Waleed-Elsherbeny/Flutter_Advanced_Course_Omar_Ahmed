import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/Constants/shared_pref_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/extensions/string_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static saveData(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      default:
        return null;
    }
    debugPrint("SharedPrefHelper saveData key: $key value: $value");
  }

  static deleteValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    debugPrint("SharedPrefHelper clearAllData");
  }

  static getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper getBool key: $key");
    return prefs.getBool(key);
  }

  static Future getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper getString key: $key");
    return prefs.getString(key);
  }

  static getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper getInt key: $key");
    return prefs.getInt(key);
  }

  static getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper getDouble key: $key");
    return prefs.getDouble(key);
  }

  /// This function checks if the user is logged in or not.
  /// It returns [true] if the user is logged in, and [false] if the user is not logged in.
  /// The check is done by checking if the user token is not null.
  /// If the user token is null, then the user is not logged in.
  static Future<bool> isUserLogin() async {
    await SharedPreferences.getInstance();
    String? token = await getSecuredData(SharedPrefConstants.userToken);
    debugPrint("SharedPrefHelper isUserLogin token: $token");
    if (token.isNullOrEmpty()) return false;
    return true;
  }

  static saveSecuredData(String key, String value) async {
    final storage = const FlutterSecureStorage();
    await storage.write(key: key, value: value);
    debugPrint("SharedPrefHelper SaveSecuredData key: $key value: $value");
  }

  static getSecuredData(String key) async {
    final storage = const FlutterSecureStorage();
    String value = await storage.read(key: key) ?? '';
    debugPrint("SharedPrefHelper SaveSecuredData key: $key value: $value");
    return value;
  }
}
