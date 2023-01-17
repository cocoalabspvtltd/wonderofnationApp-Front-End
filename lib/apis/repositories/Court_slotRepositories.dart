import 'dart:async';
import 'package:intl/intl.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';




class Court_clubRepository {

  Future  getcourtclubList(String date,int bookingMethod,int court_id) async {
    final format = DateFormat("dd-MM-yyyy");
    DateTime gettingDate = format.parse( date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(gettingDate);
    print("formatted-<>>>>>>>${formatted}");

    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "date":formatted,
      "type":bookingMethod,
      "court_id":court_id,

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("_queryParameters : " + _queryParameters.toString());
    print("clubs/courtreserve");
    final response = await WebApiProvider().getData(
        url:"clubs/courtreserve",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>${response}");
    return response as List;
  }
}
