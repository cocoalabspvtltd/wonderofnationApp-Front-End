import 'dart:async';
import 'package:oo/apis/repositories/registerRepositories.dart';
import '../../constants/webApiprovider.dart';



class Court_clubRepository {

  Future  getcourtclubList(String date,String bookingMethod,int court_id) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("_queryParameters : " + _queryParameters.toString());
    print("clubs/courtreserve?date=${date}&bookingmethod=${bookingMethod}&court_id=${court_id}");
    final response = await WebApiProvider().getData(
        url:"clubs/courtreserve?date=${date}&bookingmethod=private&court_id=${court_id}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");
    return response as List;
  }
}
