import 'dart:async';

import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/joined_club_Model.dart';
import '../modelclass/profile_model.dart';
 String profilename  = "";

class ProfilepageRepositories {

  Future  getprofileList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "profile-page",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("responseee->>>${response}");


    return (response as List)
        .map((x) => ProfileModelClass.fromJson(x))
        .toList();
  }
}
