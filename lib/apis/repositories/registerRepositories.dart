import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/baseurls.dart';
import '../../homePage/navigator.dart';
String name = "";
var TOKEN;

var userid;

var DoctorName;

class drLOginRepository {
  var dio = Dio();


  Future createUser(String username, String password, context) async {

    var formData = {
      "email":username,
      "password":password
    };
    print("formdata->>>>>>${formData}");
    try {
      Dio _dio = new Dio();
      _dio.options.contentType = Headers.formUrlEncodedContentType;
print("baseurl${baseurl}login");
      Response responseData = await dio.post("${baseurl}login",
          data: formData,
          options: Options(
            headers: {"Accept":'application/json'},
          )
      );
      print("fdsf");
      print(responseData.toString());

      Map token = responseData.data;
      print("Response->>>>>${responseData.toString()}");
      name = token["user"]["name"];
    TOKEN = token["token"];
print("TOKEN->${name}");
      if (responseData.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
        );

        return responseData;
      }





    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Username or password is not registerd",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
