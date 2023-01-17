import 'dart:async';

import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/notification_repositories.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';


class NotificationBloc {
  NotificationRepository _notificationRepository =new NotificationRepository();

  bool hasNextPage = false;
  int pagenumber = 1;
  int perPage = 20;
  LoadMoreListener? listener;
  final _notificationController =
  StreamController<Response<NotificationModelClass>>();

  StreamSink<Response<NotificationModelClass>>
  get notificationDataSink =>
      _notificationController.sink;

  Stream<Response<NotificationModelClass>>
  get notificationstream =>
      _notificationController.stream;
  NotificationBloc({this.listener}) {
    if (_notificationRepository == null)
      _notificationRepository = NotificationRepository();

  }

  getNotification(bool isPagination, {int? perpage}) async {
    if (isPagination) {
      pagenumber = pagenumber + 1;
      listener?.refresh(true);

      print("page number" + pagenumber.toString());
    } else {
      notificationDataSink.add(Response.loading('Fetching'));
      pagenumber = 1;
      notificationDataSink.add(Response.loading('Fetching'));
    }

    try {

    NotificationModelClass? _notificationlist =
    await _notificationRepository.getnotification(pagenumber,perPage);
    notificationDataSink.add(Response.success(_notificationlist!));
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        notificationDataSink!
            .add(Response.error(error.toString()));
      }
    }
    finally {}
  }

  dispose() {
    _notificationController.close();
  }
}