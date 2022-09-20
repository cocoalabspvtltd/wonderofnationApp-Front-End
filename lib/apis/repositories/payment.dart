

import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';
String Orderid ="";
String key ="";
int amount =0;
class Payemnt {

  Future  getpaymentList() async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "court_id":2,
      "type":1,
      "date":"2022-09-19",
      "time_slot_id":7,
      "amount":2500,
    };
    print("court/payment");
    print("_queryParameters : " + _queryParameters.toString());
    final response = await WebApiProvider().getData(
        url: "court/payment",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>${response}");
    Orderid= response["order_id"];
    key =response["key"];
    amount = response["amount"];
    print("Orderid->>>${Orderid}");
    return response;
  }
}
