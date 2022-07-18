import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';
import '../../addClubs/myclubs.dart';
import '../../constants/webApiprovider.dart';


class AcademyRegistrationRepository{
  getacademyregistration( context, int sportid,String Name,dateofbirth,gender,address,phone,email, imgpath,videopath) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "sport_id":designatioids,
      "name":Name,
      "dob":dateofbirth,
      "gender":gender,
      "address":address,
      "phone":phone,
      "email":email,
      "img":imgpath,
      "video":videopath
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url: "store/applicant",
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
