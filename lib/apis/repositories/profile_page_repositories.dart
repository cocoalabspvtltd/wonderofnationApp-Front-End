import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/base_urls.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/joined_club_Model.dart';
import '../modelclass/profile_model.dart';
 String profilename  = "";

class ProfilepageRepositories {

  Future  getprofileList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "profile-page",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("responseee->>>${response}");


    return (response as List)
        .map((x) => ProfileModelClass.fromJson(x))
        .toList();
  }

  // Future  getprofileImageList(File? image) async {
  //  String fileName = image!.path.split('/').last;
  //   final Map<String, dynamic> _queryParameters = <String, dynamic>{
  //     "profile_pic":fileName,
  //   };
  //   print("_queryParameters : " + _queryParameters.toString());
  //   print("token=${TOKEN}");
  //   final response = await WebApiProvider().getData(
  //       url:"profile",
  //       isPost: true,
  //       token: TOKEN,
  //       queryParameters: _queryParameters,
  //       isQueryParmeter: true);
  //   print("responseee->>>${response}");
  //   return response;
  // }

      WebApiProvider apiProvider= WebApiProvider();

  Future getprofileImageList(File reportFile) async {
    String fileName = reportFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      "profile_pic":
      await MultipartFile.fromFile(reportFile.path, filename:fileName),
    });
    final response = await apiProvider
        .getMultipartInstance()
        .post(baseurl+"profile", data: formData,
      options: Options(
     headers: {
       'Accept':'application/json',
       'Authorization':"Bearer " + TOKEN,
     }
      )

    );
    print("->>>>>>>>>>>${response}");
    return response;
  }
}
