

import 'package:intl/intl.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';
String Orderid ="";
String key ="";
int amount =0;
String refferel = "";
class Payemnt {

  Future  getpaymentList( int court_id,type,String date, int time_slot,amount) async {
    final format = DateFormat("dd-MM-yyyy");
    DateTime gettingDate = format.parse( date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(gettingDate);
    print("formatted-<>>>>>>>${formatted}");

    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "court_id": court_id,
      "type": type,
      "date": formatted,
      "time_slot_id": time_slot,
      "amount": amount,
      "hold_court":1,
    };
    print("court/payment");
    print("_queryParameters : " + _queryParameters.toString());
    final response = await WebApiProvider().getData(
        url:"court/payment",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>--------${response}");
    Orderid= response["order_id"];
    key =response["key"];
    amount = response["amount"];
    refferel = response["referral_code"];

    print("Orderid->>>${Orderid}");
    return response;
  }
}
