
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';
import 'package:oo/homePage/levellingRegister1.dart';
import 'package:oo/homePage/register.dart';

import '../../addClubs/myclubs.dart';
import '../../constants/webApiprovider.dart';
import '../../dropdowns/registergamedropdown.dart';
import '../../homePage/levelling2.dart';
import '../../homePage/navigator.dart';
import 'clublistrepositories.dart';



class LevellingRegisterRepository{
  getLevel1port( context,) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "sport_id":designatioids,
      "q1":answers1,
      "q2":answers2,
      "q3":answers3,
      "q4":answers4,
      "q5":answers5
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url:"level/store",
          isPost:true,
          token:TOKEN,
          queryParameters:_queryParameters,
          isQueryParmeter:true);
      print("object0->>>>${response}");
      if (response["message"] == "Successfully added") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DashBoard()),
        );
      } else {
        throw response["message"];
      }
    } catch (error) {
      print(error);
    }
  }
}
