import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';

import '../../constants/webApiprovider.dart';
import '../modelclass/joinedclubModel.dart';


class MyClubRepository {

  Future  getMyclubList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "club/joined",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");


    return (response as List)
        .map((x) => JoinedClubModel.fromJson(x))
        .toList();
  }
}
