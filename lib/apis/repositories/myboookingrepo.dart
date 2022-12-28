
import 'package:dio/dio.dart';
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
      "match_type":1
    });
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"bookings/upcoming", data: formData,
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

class MyOrdersRepositoryUser1 {
  late WebApiProvider apiProvider;

  MyOrdersRepositoryUser() {
    apiProvider = new WebApiProvider();
  }

  Future<AddPlayersModel> getAllOrdersList(int perPage, int page) async {
    FormData formData = FormData.fromMap({
      "page":page,
      "per_page":perPage,
      "match_type":2
    });
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"bookings/upcoming", data: formData,
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