import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
    import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/base_urls.dart';
import '../../screens/homePage/navigator.dart';

String name = "";
String phone = "";
String email ="";
String pass ="";
String confpass ="";
var TOKEN;
var userid;
var DoctorName;
class drLOginRepository  {
  var dio = Dio();
  Future createUser(String username, String password, context) async {
    EasyLoading.show(status: 'loading...');
    var formData = {
      "email":username,
      "password":password
    };
    print("formdata->>>>>>${formData}");
    try {
      Dio _dio = new Dio();
      _dio.options.contentType = Headers.formUrlEncodedContentType;

      Response responseData = await dio.post("${baseurl}login",
          data: formData,
          options: Options(
            headers: {"Accept":'application/json'},
          )
      );
      Map token = responseData.data;
      name = token["user"]["name"];
      phone = token["user"]["phone"];
      email = token["user"]["email"];
      TOKEN = token["token"];

      if (responseData.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: name,)),
        );
        EasyLoading.dismiss();

        return responseData;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Username or password is not registerd",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      EasyLoading.dismiss();
    }
  }
}
