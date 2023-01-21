

import 'package:intl/intl.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';

import '../../constants/web_Api_provider.dart';
import '../../screens/matches/reservation_court.dart';

class GetRefferelCode {

  Future  getRefferelCode( int court_id, int time_slot,refferel,String date,) async {
    final format = DateFormat("dd-MM-yyyy");
    DateTime gettingDate = format.parse( date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(gettingDate);
    print("formatted-<>>>>>>>${formatted}");

    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "court_id":3,
      "time_slot_id":18,
      "referral_code":refferel,
      "date":formatted
    };

    print("_queryParameters : " + _queryParameters.toString());
    final response = await WebApiProvider().getData(
        url:"verify/referral-code",
        isPost: true,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>--------${response}");

    return response;
  }
}
