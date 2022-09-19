

import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';
String Orderid ="";
String key ="";
int amount =0;
class Payemnt {

  Future  getpaymentList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
"name":name,
      "amount":200
    };
    print("court/payment");
    print("token=${TOKEN}");
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
