import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';

import '../../constants/webApiprovider.dart';
import '../modelclass/joinedclubModel.dart';
import '../modelclass/profilemodel.dart';


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
    print("res->>>${response}");


    return (response as List)
        .map((x) => ProfileModelClass.fromJson(x))
        .toList();
  }
}
