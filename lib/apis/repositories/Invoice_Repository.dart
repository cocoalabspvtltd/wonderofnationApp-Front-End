import 'dart:async';
import 'package:oo/apis/modelclass/InvoiceModel.dart';
import 'package:oo/apis/repositories/payment.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';

import '../../constants/web_Api_provider.dart';




class InvoiceRepository {

  Future  getinvoiceList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url:"clubs/invoice?paymentid=${Orderid}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");
    return (response as List)
        .map((x) => InvoiceModelClass.fromJson(x))
        .toList();
  }
}
