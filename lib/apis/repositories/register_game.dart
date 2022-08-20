


import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/sport_model.dart';


class AppointmentMeasurmentDetailsRepository1 {
  Future getAppointmentMeasurmentEditDetails1() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    final response = await WebApiProvider().getData(
        url: "get/sports",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false
    );

    print("res->>>>>>>>>${response}");
    return (response);
  }
}
