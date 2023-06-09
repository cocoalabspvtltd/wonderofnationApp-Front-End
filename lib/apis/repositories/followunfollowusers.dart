import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/web_Api_provider.dart';

import '../../constants/user.dart';
String followMessage = "";
class FollowRepositories {
  WebApiProvider apiProvider = WebApiProvider();

  doFollow(int id) async {
    FormData formData = FormData.fromMap({
      "user_id": id,

    });
    try {
      final resoponse = await apiProvider
          .getJsonInstance()
          .post(baseurl + "follow",data: formData,options: Options(headers:{
                      'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,

      }));
      if (followMessage=="success"){
        followMessage== "success"?  EasyLoading.show(status: 'loading...'):EasyLoading.dismiss();
      }
      followMessage = resoponse.data["message"];
      print("=???${resoponse.data["message"]}");
      Fluttertoast.showToast(msg:"Start to follow");
      return resoponse.data;
      }catch(error){
      print("error");
    print(error.toString());
                      }

      }
  doUnFollow(int id) async {
    print("fg");
    FormData formData = FormData.fromMap({
      "user_id": id,

    });
    try {
      final resoponse = await apiProvider
          .getJsonInstance()
          .post(baseurl + "unfollow",data: formData,options: Options(headers:{
        'Accept':'application/json',
        'Authorization':"Bearer " + UserDetails.apiToken,

      }));
      followMessage = resoponse.data["message"];
      print("=?${resoponse.data["message"]}");
      Fluttertoast.showToast(msg:"Start to unfollow");
      return resoponse.data;
    }catch(error){
      print("error");
      print(error.toString());
    }
  }
      }