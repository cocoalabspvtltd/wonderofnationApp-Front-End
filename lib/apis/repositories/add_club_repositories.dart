import 'dart:async';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';
import '../../constants/webApiprovider.dart';
import '../../dropdowns/registergamedropdown.dart';
import '../modelclass/add_club_modelclass.dart';


int club_id = 0;
class AddClubRepositories {

  Future  getaddclubList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "clubs/all-list",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    // club_id = response[3]["id"];

    print("res->>>${club_id}");
    return (response as List)
        .map((x) => AddClubModelclass.fromJson(x))
        .toList();
  }
}
