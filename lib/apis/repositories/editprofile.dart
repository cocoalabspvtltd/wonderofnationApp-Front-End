import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';
import 'package:oo/homePage/navigator.dart';
import '../../addClubs/myclubs.dart';
import '../../constants/webApiprovider.dart';
import '../../profile/profile_page.dart';


class EditprofileRepostory{
  getEditprofile( context, String userName,userEmail,UserMobile,bio) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
  "name":userName,
  "email":userEmail,
  "phone":UserMobile,
  "bio":bio,
  "profilePic":""
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      print("object->>>>>${TOKEN}");
      final response = await WebApiProvider().getData(
          url:"profile-update",
          isPost:true,
          token:TOKEN,
          queryParameters:_queryParameters,
          isQueryParmeter:true);
      print("object->>>>>${TOKEN}");
      print("object0->>>>${response}");
      if (response["message"] == "Successfully updated") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  profileui()),
        );
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
