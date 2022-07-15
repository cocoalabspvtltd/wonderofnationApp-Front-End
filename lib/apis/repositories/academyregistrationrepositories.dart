
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';

import '../../addClubs/myclubs.dart';
import '../../constants/webApiprovider.dart';
import '../../homePage/navigator.dart';
import 'clublistrepositories.dart';



class AcademyRegistrationRepository{
  getacademyregistration( context, int sportid,String Name, ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
    "sport_id":2,
    "name":anjana,
    "dob":1999/07/27
    "gender":f
    "address":faasfsdfsfdfdfsd
    "phone":7012733764
    "email":anjanam@gmail.com

    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url: "club/join",
          isPost: true,
          token: TOKEN,
          queryParameters: _queryParameters,
          isQueryParmeter: true);
      print("object0->>>>${response}");
      if (response["message"] == "success") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Myclubs()),
        );
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
