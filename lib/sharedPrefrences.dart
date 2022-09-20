// import 'package:get/get.dart';
// import 'package:oo/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class SharedPrefs {
//   static late SharedPreferences _preferences;
//
//   static String spToken = 'spToken';
//   static String spUserId = 'spUserId';
//   static String spEmail = 'spEmail';
//   static String spName = 'spName';
//   static String spMobile = 'spMobile';
//   static String spAddress = 'spAddress';
//   static String spRole = 'spRole';
//
//   static init() async {
//     _preferences = await SharedPreferences.getInstance();
//
//     User.set(
//       getString(spToken),
//       getString(spUserId),
//       getString(spName),
//       getString(spEmail),
//       getString(spMobile),
//       getString(spAddress),
//       getString(spRole),
//     );
//   }
//
//   static String getString(String key) {

//     return _preferences.getString(key) ?? '';


//   }
//
//   static Future<bool> setString(String key, String value) async {
//     return await _preferences.setString(key, value);
//   }
//
//   static Future<bool> logIn(UserSignUpResponse response) async {
//     if (response.userDetails == null) return false;
//
//     String token = response.apiToken ?? User.apiToken;
//     UserDetails userDetails = response.userDetails!;
//
//     await setString(spToken, '$token');
//     await setString(spUserId, '${userDetails.id ?? ''}');
//     await setString(spEmail, '${userDetails.email ?? ''}');
//     await setString(spName, '${userDetails.name ?? ''}');
//     await setString(spMobile, '${userDetails.phone ?? ''}');
//     await setString(spAddress, '${userDetails.address ?? ''}');
//     await setString(spRole, '${userDetails.role ?? ''}');
//
//     User.set(
//       token,
//       '${userDetails.id ?? ''}',
//       '${userDetails.name ?? ''}',
//       '${userDetails.email ?? ''}',
//       '${userDetails.phone ?? ''}',
//       '${userDetails.address ?? ''}',
//       '${userDetails.role ?? ''}',
//     );
//     return true;
//   }
//
//   static Future<bool> logOut() async {
//     await _preferences.clear();
//     User.set('', '', '', '', '', '', '');
//
//     Get.offAll(() => SplashScreen(isFromLogout: true));
//     return true;
//   }
//
//   static Future<bool> setBool(String key, bool value) async {
//     return await _preferences.setBool(key, value);
//   }
//
//   static bool getBool(String key) {
//     return _preferences.getBool(key) ?? false;
//   }
// }
