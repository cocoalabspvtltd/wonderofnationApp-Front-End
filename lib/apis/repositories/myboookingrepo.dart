

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/web_Api_provider.dart';

import 'register_Repositories.dart';

class MyOrdersRepositoryUser {
  late WebApiProvider apiProvider;

  MyOrdersRepositoryUser() {
    apiProvider = new WebApiProvider();
  }

  Future<AddPlayersModel> getAllOrdersList(int perPage, int page) async {
    FormData formData = FormData.fromMap({
      "page":page,
      "per_page":perPage,
      "match_type":1 ,
      "request_page":1,
    });
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"bookings/matches", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return AddPlayersModel.fromJson(response.data) ;

  }
}

class MyOrdersRepositoryUser1 {
  late WebApiProvider apiProvider;

  MyOrdersRepositoryUser1() {
    apiProvider = new WebApiProvider();
  }

  Future<AddPlayersModel> getAllOrdersList(int perPage, int page) async {
    FormData formData = FormData.fromMap({
      "page":page,
      "per_page":perPage,
      "match_type":2,
      "request_page":1,
    });
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"bookings/matches", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return AddPlayersModel.fromJson(response.data);

  }
}

class historyRepositories {
  late WebApiProvider apiProvider;

  historyRepositories() {
    apiProvider = new WebApiProvider();
  }

  Future<AddPlayersModel> getAllOrdersList(int perPage, int page) async {
    FormData formData = FormData.fromMap({
      "page":page,
      "per_page":perPage,
      "match_type":1,
      "request_page":2,
    });
    print("formdata->${formData.fields}");
    final response = await  apiProvider
        .getJsonInstance()
        .post(baseurl+"bookings/matches", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return AddPlayersModel.fromJson(response.data);

  }
  Future  getStataus(int id , status) async {
    FormData formData = FormData.fromMap({
      "match_id":id,
      "win_status":status,
    });
    print("formdata->${formData.fields}");
    final response = await  apiProvider
        .getJsonInstance()
        .post(baseurl+"booking/win/status", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    Fluttertoast.showToast(msg: response.data['message']);

    return response.data;

  }
}