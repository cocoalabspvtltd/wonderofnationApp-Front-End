import 'package:flutter/material.dart';

class USer1 {
  static String apiToken = '';
  static String userId = '';
  static String userName = '';
  static String userEmail = '';
  static String userGender = '';
  static String userDob = '';
  static String userHeight = '';
  static String userWeight = '';
  static String userRole = '';
  static String userMobile = '';
  static String userAddress = '';

  static String userImageUrl = '';
  static ValueNotifier userImageUrlValueNotifier = ValueNotifier("");

  static void set(
      String token,
      String id,
      String name,
      String email,
      String mobile,
      String imageUrl) {
    apiToken = token;
    userId = id;
    userName = name;
    userEmail = email;
    userMobile = mobile;

    userImageUrl = imageUrl;
  }
}
