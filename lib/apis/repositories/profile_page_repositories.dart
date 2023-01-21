import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/screens/dropdowns/games_dropdown.dart';
import '../../constants/base_urls.dart';
import '../../constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/joined_club_Model.dart';
import '../modelclass/profile_model.dart';
 String profilename  = "";
Map levelList={} ;
class ProfilepageRepositories {

  Future  getprofileList() async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "profile-page",
        isPost: true,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    //print("responseee->>>${response[0]["levels"]}");

 // levelList = response[0]["levels"];
    return (response as List)
        .map((x) => ProfileModelClass.fromJson(x))
        .toList();
  }

  Future  getUserProfilesuggestionList(String userid ) async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "user_id":userid
    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "profile-page",
        isPost: true,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("responseee->>>${response}");


    return (response as List)
        .map((x) => ProfileModelClass.fromJson(x))
        .toList();
  }
  // getUserProfilesuggestionList(int userid ) async {
  //   FormData formData = FormData.fromMap({
  //  "user_id":123
  //
  //   });
  //   try {
  //     final resoponse = await apiProvider
  //         .getJsonInstance()
  //         .post(baseurl + "profile-page",data: formData,options: Options(headers:{
  //       'Accept':'application/json',
  //       'Authorization':"Bearer " + TOKEN,
  //
  //     }));
  //
  //     print("=???${resoponse.data}");
  //     return ProfileModelClass.fromJson(resoponse.data);
  //   }catch(error){
  //     print("error");
  //     print(error.toString());
  //   }
  //
  // }


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
    print("file->$reportFile");
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
       'Authorization':"Bearer " + UserDetails.apiToken,
     }
      )

    );
    print("->>>>>>>>>>>${response}");
    return response;
  }

}
