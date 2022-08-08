
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';
import 'package:oo/homePage/homepage1.dart';
import 'package:oo/homePage/levellingRegister1.dart';
import 'package:oo/homePage/register.dart';

import '../../addClubs/myclubs.dart';
import '../../constants/webApiprovider.dart';
import '../../dropdowns/game_list_register.dart';
import '../../dropdowns/registergamedropdown.dart';
import '../../homePage/levelling2.dart';
import '../../homePage/navigator.dart';
import '../../screens/login.dart';
import 'clublistrepositories.dart';



class LogoutRepository{
  getLogoutRepository(context ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url:"logout",
          isPost:false,
          token:TOKEN,
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
