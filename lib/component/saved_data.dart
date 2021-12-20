

import 'package:shared_preferences/shared_preferences.dart';

import 'constance.dart';

class MyPrefs {


  SharedPreferences? preferences;


  static Future<void> removeTokenShared(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(token);
  }
  static Future<void> setAuthCode(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.authCode, authcode);
  }
  static Future<String> getAuthCode( ) async {
    var prefs = await SharedPreferences.getInstance();
    return  prefs.getString(Constance.authCode) ?? "";
  }

}
