import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
    import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/modelclass/loginmodel.dart';
import 'package:oo/apis/modelclass/userloginresponse.dart';
import 'package:oo/constants/apiProvider.dart';
import '../../constants/base_urls.dart';
import '../../screens/homePage/navigator.dart';

class AuthRepository  {
  var dio = Dio();
  ApiProvider apiProvider = ApiProvider();

  Future<UserSignInModel> registerUser(String body) async {
    Response response = await apiProvider!
        .getJsonInstance()
        .post("${baseurl}create", data: body);
    return UserSignInModel.fromJson(response.data);
  }
  Future<UserSignInModel> login(String body) async {
    Response response =
    await apiProvider!.getJsonInstance().post("${baseurl}login", data: body);
    return UserSignInModel.fromJson(response.data);
  }
}
