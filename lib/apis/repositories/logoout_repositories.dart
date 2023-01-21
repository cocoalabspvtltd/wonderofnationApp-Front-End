
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/login.dart';
import 'club_list_repositories.dart';



class LogoutRepository{
  getLogoutRepository(context ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url:"logout",
          isPost:false,
          token:UserDetails.apiToken,
          queryParameters:_queryParameters,
          isQueryParmeter:false);
      print("object0->>>>${response}");

      if (response["message"] == "Log out successful") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()),
        );
      } else {
        throw response["message"];
      }
    } catch (error) {
      print(error);
    }
  }
}
