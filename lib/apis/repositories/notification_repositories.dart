import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/web_Api_provider.dart';

class NotificationRepository {

  WebApiProvider apiProvider= WebApiProvider();

  Future getnotification() async {


    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"user/notifications",
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
print("=>${response.data}");
    return NotificationModelClass.fromJson(response.data);

  }
}