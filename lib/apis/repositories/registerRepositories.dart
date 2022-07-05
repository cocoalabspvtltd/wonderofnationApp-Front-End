// // import 'dart:async';
// //
// // import 'package:oo/apis/modelclass/RegisterModel.dart';
// // import 'package:oo/homePage/register.dart';
// //
// // import '../../constants/webApiprovider.dart';
// //
// //
// // class RegisterRepository {
// //   Future<List<RegisterModel>> getlabTest() async {
// //     final Map<String, dynamic> _queryParameters = <String, dynamic>{
// //       "password": passwordController.text,
// //       "email": emailController.text,
// //       "password_confirmation": confirmpassController.text,
// //       "name":usernameController.text,
// //       "phone":mobileController.text
// //     };
// //     print("_queryParameters : " + _queryParameters.toString());
// //
// //     final response = await WebApiProvider().getData(
// //         url: "api/create",
// //         isPost: true,
// //         queryParameters: _queryParameters,
// //         isQueryParmeter: true);
// //     print("nj");
// //     print("response->${response}");
// //
// //     return (response as List).map((x) => RegisterModel.fromJson(x)).toList();
// //   }
// // }
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// var TOKEN;
//
// var userid;
//
// var DoctorName;
//
// class drLOginRepository {
//   var dio = Dio();
//
//
//   Future createUser(String name,email,mobile,pass,conpass,) async {
//     print("sdfgh");
//     var formData = {
//       'name': name,
//       'email': email,
//       'phone': mobile,
//       'password': pass,
//       'password_confirmation': conpass,
//     };
//     print("formdata->>>>>>${formData}");
//     try {
//       Dio _dio = new Dio();
//       _dio.options.contentType = Headers.formUrlEncodedContentType;
//
//       final responseData = await _dio.post<Map<String, dynamic>>(
//           'http://c167-59-98-50-140.ngrok.io/api/create',
//           data: formData);
//       print("rea->>${responseData}");
//       var token = responseData.data;
//       var token1 = token?["data"];
//       TOKEN = token1["token"];
//       print("token1->>>>>${TOKEN}");
//       print("Response->>>>>${responseData.toString()}");
//
//       if (responseData.statusCode == 200) {
//
//         var role = responseData.data;
//         var userId = responseData.data;
//         var doctorname = responseData.data;
//         userid = userId?["id"];
//         DoctorName = doctorname?["userId"];
//         var role1 = role?["roles"];
//         print("role1->>>>>${DoctorName}");
//         print("Bearer--->>>>>>>Bearer ${TOKEN}");
//
//
//       }
//       if (responseData.statusCode == 200) {
//         // WidgetsBinding.instance!.addPostFrameCallback((_) {
//         //   Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE);
//         // });
//
//         return responseData;
//       }
//     } catch (e) {
//       print(e);
//       Fluttertoast.showToast(
//         msg: "Username or password is not registerd",
//         gravity: ToastGravity.BOTTOM,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     }
//   }
// }
