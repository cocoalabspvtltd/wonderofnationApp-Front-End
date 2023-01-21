import 'dart:async';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/joined_club_Model.dart';


class MyClubRepository {
  Future  getMyclubList() async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());


    final response = await WebApiProvider().getData(
        url: "club/joined",
        isPost: false,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
        print("res->>>${response}");
        return (response as List)
        .map((x) => JoinedClubModel.fromJson(x))
        .toList();
  }
}
