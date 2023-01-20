import 'package:get/get.dart';
import 'package:oo/utilities/user.dart';
import 'package:oo/welcome.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../apis/modelclass/loginmodel.dart';

class SharedPrefs {
    static SharedPreferences? _preferences;

  static String spToken = 'spToken';
  static String spUserId = 'spUserId';
  static String spEmail = 'spEmail';
  static String spName = 'spName';
  static String spMobile = 'spMobile';
  static String spAddress = 'spAddress';
  static String spGender = 'spGender';
  static String spDob = 'spDob';
  static String spHeight = 'spHeight';
  static String spWeight = 'spWeight';
  static String spRole = 'spRole';
  static String spUserImageUrl = 'spUserImageUrl';

  static init() async {
    _preferences = await SharedPreferences.getInstance();

    USer1.set(
        getString(spToken),
        getString(spUserId),
        getString(spName),
        getString(spEmail),
        getString(spMobile),
        getString(spUserImageUrl));
  }

  static String getString(String key) {
    return _preferences?.getString(key) ?? '';
  }

  static Future<bool?> setString(String key, String value) async {
    return await _preferences?.setString(key, value);
  }

  static Future<bool> logIn(UserDetails response) async {
    if (response.user == null) return false;

    String token = response.token ?? USer1.apiToken;
    User? userDetails = response.user;

    await setString(spToken, '$token');
    await setString(spUserId, '${userDetails?.id?? ''}');
    await setString(spEmail, '${userDetails?.email ?? ''}');
    await setString(spName, '${userDetails?.name ?? ''}');
    await setString(spMobile, '${userDetails?.phone ?? ''}');
    await setString(spUserImageUrl, '${userDetails?.profilePic ?? ''}');

    USer1.set(
        token,
        '${userDetails?.id  ?? ''}',
        '${userDetails?.name ?? ''}',
        '${userDetails?.email ?? ''}',
        '${userDetails?.phone ?? ''}',
        '${userDetails?.profilePic ?? ''}',
    );
    return true;
  }

  static Future<bool> logOut() async {
    await _preferences?.clear();
    USer1.set('', '', '', '', '', '', );

    //Get.offAll(() => WelcomeScreen(isFromLogout: true));
    return true;
  }

  static Future<bool?> setBool(String key, bool value) async {
    return await _preferences?.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences?.getBool(key) ?? false;
  }
}
