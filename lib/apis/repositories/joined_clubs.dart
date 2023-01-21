
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/addClubs/my_clubs.dart';




class ClubjoinedbuttonRepository{
  getLeaveeport( context, int listId) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "club_id": listId,

    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url: "club/join",
          isPost: true,
          token: UserDetails.apiToken,
          queryParameters: _queryParameters,
          isQueryParmeter: true);
print("object0->>>>${response}");
      if (response["message"] == "success") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyClubs()),
        );
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
