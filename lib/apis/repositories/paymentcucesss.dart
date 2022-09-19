

import 'package:oo/apis/repositories/payment.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';
import '../../screens/matches/reservation_court.dart';

class PayemntSucess {

  Future  getpaymentsucessList(String razorpay_payment_id,razorpay_order_id ,razorpay_signature) async {
    print("token=${razorpay_payment_id}");
    print("token=${razorpay_order_id}");
    print("token=${razorpay_signature}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "razorpay_payment_id":PaymentId,
      "razorpay_order_id":Orderid,
      "razorpay_signature":razorpay_signature
    };
    print("court/payment");
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "payment/signature-verify",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>${response}");
    // Orderid= response["order_id"];
    // key =response["key"];
    // amount = response["amount"];
    // print("Orderid->>>${Orderid}");
    return response;
  }
}
