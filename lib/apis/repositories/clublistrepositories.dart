import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';

import '../../constants/webApiprovider.dart';

int club_id = 0;
class ClubRepository {

  Future  getclubList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "clubs/show",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
print("res->>>${response}");

 print("id->>>${club_id}");
    return (response as List)
        .map((x) => ClubModel.fromJson(x))
        .toList();
  }
}
