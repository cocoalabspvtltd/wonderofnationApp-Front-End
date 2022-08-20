import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/profile/profile_page.dart';



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
          MaterialPageRoute(builder: (context) =>  ProfileUi()),
        );
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
