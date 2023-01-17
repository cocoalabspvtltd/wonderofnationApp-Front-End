import 'package:flutter/material.dart';

class User {
  static String apiToken = '';
  static String userId = '';
  static String userName = '';
  static String userEmail = '';
  static String userRole = '';
  static String userMobile = '';
  static String userAddress = '';

  // static  String userImageUrl='';
  static ValueNotifier userImageUrlValueNotifier = ValueNotifier("");

  static void set(String token, String id, String name, String email,
      String mobile, String address, String role) {
    apiToken = token;
    userId = id;
    userName = name;
    userEmail = email;
    userMobile = mobile;
    userAddress = address;
    userRole = role;
    // userImageUrl = imageUrl;
  }
}
