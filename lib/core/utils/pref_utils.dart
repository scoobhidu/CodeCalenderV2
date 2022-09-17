//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  Future<void> setUserGoogleDisplayName(String value) {
    print(value);
    return _sharedPreferences!.setString('googleDisplayName', value);
  }

  String getUserGoogleDisplayName() {
    try {
      return _sharedPreferences!.getString('googleDisplayName') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setUserGoogleEmail(String value) {
    print(value);
    return _sharedPreferences!.setString('googleEmail', value);
  }

  String getUserGoogleEmail() {
    try {
      return _sharedPreferences!.getString('googleEmail') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setUserGooglePhotoURL(String value) {
    print(value);
    return _sharedPreferences!.setString('googlePhotoURL', value);
  }

  String getUserGooglePhotoURL() {
    try {
      return _sharedPreferences!.getString('googlePhotoURL') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setUserGoogleUniqueID(String value) {
    print(value);
    return _sharedPreferences!.setString('googleUniqueID', value);
  }

  String getUserGoogleUniqueID() {
    try {
      return _sharedPreferences!.getString('googleUniqueID') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }
}
