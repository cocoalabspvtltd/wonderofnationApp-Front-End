import 'dart:async';
import 'dart:math';

import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/apis/repositories/myboookingrepo.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';

class MyOrdersBlocUser {
  MyOrdersRepositoryUser? _myordersRepository;

  MyOrdersBlocUser({this.listener}) {
    if (_myordersRepository == null)
      _myordersRepository = MyOrdersRepositoryUser();

    _myordersListController =
    StreamController<Response<MyBookingModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<MyBookingModel>>
  _myordersListController;

  StreamSink<Response<MyBookingModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<MyBookingModel>> get myordersDetailsListStream =>
      _myordersListController.stream;

  List<Matches> myordersDetailsList = [];

  getmyordersDetailsList(bool isPagination, {int? perPage}) async {
    if (isPagination) {
      pageNumber = pageNumber + 1;
      listener!.refresh(true);

      print("page number=========" + pageNumber.toString());
    } else {
      myordersDetailsListSink!.add(Response.loading('Fetching Data'));
      pageNumber = 1;
      //productDetailsListSink!.add(ApiResponse.loading('Fetching items'));
    }
    try {
      MyBookingModel response =
      await _myordersRepository!.getAllOrdersList(20, pageNumber);
      // pageNumber = response.products!.total!;
      hasNextPage =
      response.lastPage! >= pageNumber.toInt() ? true : false;
      //pageNumber = !hasNextPage ? pageNumber - 1 : pageNumber;
      if (isPagination) {
        if (myordersDetailsList.length == 0) {
          myordersDetailsList = response.matches!;
        } else {
          myordersDetailsList.addAll(response.matches!);
        }
      } else {
        myordersDetailsList = response.matches ?? [];
      }
      myordersDetailsListSink!.add(Response.completed(response));
      if (isPagination) {
        listener!.refresh(false);
      }
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        myordersDetailsListSink!
            .add(Response.error(e.toString()));
      }
    } finally {}
  }

//GET PRODUCT SAVED

}
//////----------------------------------------------------------------//////
class MyOrdersBlocUser1 {
  MyOrdersRepositoryUser1? _myordersRepository;

  MyOrdersBlocUser1({this.listener}) {
    if (_myordersRepository == null)
      _myordersRepository = MyOrdersRepositoryUser1();

    _myordersListController =
    StreamController<Response<MyBookingModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<MyBookingModel>>
  _myordersListController;

  StreamSink<Response<MyBookingModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<MyBookingModel>> get myordersDetailsListStream =>
      _myordersListController.stream;

  List<Matches> myordersDetailsList = [];

  getmyordersDetailsList(bool isPagination, {int? perPage}) async {
    if (isPagination) {
      pageNumber = pageNumber + 1;
      listener!.refresh(true);

      print("page number=========" + pageNumber.toString());
    } else {
      myordersDetailsListSink!.add(Response.loading('Fetching Data'));
      pageNumber = 1;
      //productDetailsListSink!.add(ApiResponse.loading('Fetching items'));
    }
    try {
      MyBookingModel response =
      await _myordersRepository!.getAllOrdersList(20, pageNumber);
      // pageNumber = response.products!.total!;
      hasNextPage =
      response.lastPage! >= pageNumber.toInt() ? true : false;
      //pageNumber = !hasNextPage ? pageNumber - 1 : pageNumber;
      if (isPagination) {
        if (myordersDetailsList.length == 0) {
          myordersDetailsList = response.matches!;
        } else {
          myordersDetailsList.addAll(response.matches!);
        }
      } else {
        myordersDetailsList = response.matches ?? [];
      }
      myordersDetailsListSink!.add(Response.completed(response));
      if (isPagination) {
        listener!.refresh(false);
      }
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        myordersDetailsListSink!
            .add(Response.error(e.toString()));
      }
    } finally {}
  }

//GET PRODUCT SAVED

}
