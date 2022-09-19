import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/dropdowns/games_dropdown.dart';
import '../../screens/homePage/navigator.dart';



class AcademyRegistrationRepository{
  getacademyregistration( context, String sportid,String Name,dateofbirth,gender,address,phone,email, img,video) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "sport_id":designatioids,
      "name":Name,
      "dob":dateofbirth,
      "gender":gender,
      "address":address,
      "phone":phone,
      "email":email,
      "img":img,
      "video":video
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      print("object->>>>>${TOKEN}");
      final response = await WebApiProvider().getData(
          url:"store/applicant",
          isPost:true,
          token:TOKEN,
          queryParameters:_queryParameters,
          isQueryParmeter:true);
      print("object->>>>>${TOKEN}");
      print("object0->>>>${response}");
      if (response["message"] == "Application successfully submitted") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
        );
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
