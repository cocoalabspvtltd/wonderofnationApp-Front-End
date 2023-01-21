import 'package:get/get.dart';
import 'package:oo/apis/modelclass/user_details.dart';
import 'package:oo/apis/modelclass/userloginresponse.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/welcome.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _preferences;

  static String spToken = 'spToken';
  static String spUserId = 'spUserId';
  static String spEmail = 'spEmail';
  static String spName = 'spName';
  static String spMobile = 'spMobile';


  static init() async {
    _preferences = await SharedPreferences.getInstance();

    UserDetails.set(
        getString(spToken),
        getString(spUserId),
        getString(spName),
        getString(spEmail),
        getString(spMobile),
    );
  }

  static String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static Future<bool> logIn(UserSignInModel response) async {
    if (response.user == null) return false;

    String token = response.token ?? UserDetails.apiToken;
    User userDetails = response.user!;

    await setString(spToken, '$token');
    await setString(spUserId, '${userDetails.id ?? ''}');
    await setString(spEmail, '${userDetails.email ?? ''}');
    await setString(spName, '${userDetails.name ?? ''}');
    await setString(spMobile, '${userDetails.phone ?? ''}');


    UserDetails.set(
        token,
        '${userDetails.id ?? ''}',
        '${userDetails.name ?? ''}',
        '${userDetails.email ?? ''}',
        '${userDetails.phone ?? ''}',);
    return true;
  }

  static Future<bool> logOut() async {
    await _preferences.clear();
    UserDetails.set('', '', '', '', '', );

    Get.offAll(() => WelcomeScreen(isFromLogout: true));
    return true;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }
}
