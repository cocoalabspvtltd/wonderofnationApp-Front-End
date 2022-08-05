import 'dart:async';
import 'package:oo/apis/modelclass/invoice_model.dart';
import 'package:oo/apis/repositories/registerRepositories.dart';
import '../../constants/webApiprovider.dart';



class InvoiceRepository {

  Future  getinvoiceList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url:"clubs/invoice?paymentid=order_K1uxizHcLhcGPj",
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
