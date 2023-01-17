
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/dropdowns/game_list_register.dart';
import '../../screens/homePage/levelling2.dart';
import '../../screens/homePage/levelling_Register1.dart';
import '../../screens/homePage/navigator.dart';



class LevellingRegisterRepository{
  getLevel1port( context,userName) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "sport_id":designatioids1,
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
          MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: userName,)),
        );
      } else {
        throw response["message"];
      }
    } catch (error) {
      print(error);
    }
  }
}
