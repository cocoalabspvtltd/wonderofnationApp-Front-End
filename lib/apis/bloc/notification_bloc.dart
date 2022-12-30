import 'dart:async';

import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/notification_repositories.dart';
import 'package:oo/constants/response.dart';


class NotificationBloc {
  NotificationRepository _notificationRepository =new NotificationRepository();
  final _notificationController =
  StreamController<Response<NotificationModelClass>>();

  StreamSink<Response<NotificationModelClass>>
  get notificationDataSink =>
      _notificationController.sink;

  Stream<Response<NotificationModelClass>>
  get notificationstream =>
      _notificationController.stream;

  NotificationBloc() {
    _notificationRepository =
        NotificationRepository();
    getNotification();
    print("fsfds");
  }

  getNotification() async {
    notificationDataSink.add(Response.loading('Fetching'));
    try {
    NotificationModelClass? _notificationlist =
    await _notificationRepository.getnotification();

    notificationDataSink.add(Response.success(_notificationlist!));
    } catch (e) {
      notificationDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _notificationController.close();
  }
}