import 'dart:async';


import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/reservation_court.dart';


class ReservationRepository {

  Future  getreservationclubList(int club_id,String date) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "club_id":club_id,
      "date":date
    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "club/courts/details",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
        print("club/courts/detailsrespnse->>>${response}");
        return response as List;

  }
}
