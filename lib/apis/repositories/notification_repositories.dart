import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/constants/web_Api_provider.dart';
int notificationCount=0;
class NotificationRepository {

  WebApiProvider apiProvider= WebApiProvider();

  Future getnotification(int page,int perPage) async {
    FormData formData = FormData.fromMap({
      "page": page,
      "per_page": perPage,
    });

    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"user/notifications",
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )

    );
    notificationCount=response.data['uCount'];
  print("Notificatio response--->${response.data}");
    return NotificationModelClass.fromJson(response.data);

  }

  Future markRead() async {

    final response = await apiProvider
        .getJsonInstance()
        .get(baseurl+"mark-read",
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )

    );
    print("=>${response.data}");
    return NotificationModelClass.fromJson(response.data);

  }
  Future acceptInvitation(int matchid,String invitestatus) async {

    FormData formData = FormData.fromMap({
      "match_id":matchid,
      "invite_status":invitestatus,
    });
    print("formdata--->${formData.fields}");
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"player/update",
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )
    );
    print("=>${response.data}");
    return NotificationModelClass.fromJson(response.data);

  }
  Future statusAcceptInvitation(int statusid,matchid,int invitestatus) async {

    FormData formData = FormData.fromMap({
      "status_id":statusid,
      "match_id":matchid,
      "approved":invitestatus,
    });
    print("formdata--->${formData.fields}");
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"win/status/update",
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )
    );
    print("=>${response.data}");
    return NotificationModelClass.fromJson(response.data);

  }
}