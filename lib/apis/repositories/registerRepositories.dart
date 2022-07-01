import 'dart:async';

import 'package:oo/apis/modelclass/RegisterModel.dart';

import '../../constants/webApiprovider.dart';


class RegisterRepository {
  Future<List<RegisterModel>> getlabTest() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "password": "sdsd",
      "email": "anjana@gmail.com",
      "password_confirmation": "sdsd",
      "name": "anjana",
      "phone":"78787889787"
    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "api/create",
        isPost: true,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("response->${response}");
    return (response as List).map((x) => RegisterModel.fromJson(x)).toList();
  }
}
