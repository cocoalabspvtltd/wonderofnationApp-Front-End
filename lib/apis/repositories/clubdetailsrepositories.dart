import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import 'package:oo/dropdowns/gamesdropdown.dart';

import '../../constants/webApiprovider.dart';
import '../../dropdowns/registergamedropdown.dart';
import '../modelclass/clubdetailsmodel.dart';
import 'clublistrepositories.dart';


class ClubDetailsRepository {

  Future  getclubdetailsList(int club_id) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "clubs/details?club_id=${club_id}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");

    return (response as List)
        .map((x) => ClubDetailsModel.fromJson(x))
        .toList();
  }
}
