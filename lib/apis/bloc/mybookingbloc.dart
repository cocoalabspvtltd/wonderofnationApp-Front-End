import 'dart:async';
import 'dart:math';

import 'package:oo/apis/modelclass/ResultModel.dart';
import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/apis/repositories/appplayers_repositories.dart';
import 'package:oo/apis/repositories/myboookingrepo.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';

class MyOrdersBlocUser {
  MyOrdersRepositoryUser? _myordersRepository;

  MyOrdersBlocUser({this.listener}) {
    if (_myordersRepository == null)
      _myordersRepository = MyOrdersRepositoryUser();

    _myordersListController =
    StreamController<Response<AddPlayersModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<AddPlayersModel>>
  _myordersListController;

  StreamSink<Response<AddPlayersModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<AddPlayersModel>> get myordersDetailsListStream =>
      _myordersListController.stream;

  List<Matches> myordersDetailsList = [];

  getmyplayerDetailsList(bool isPagination, {int? perPage}) async {
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
      AddPlayersModel response =
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
    StreamController<Response<AddPlayersModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<AddPlayersModel>>
  _myordersListController;

  StreamSink<Response<AddPlayersModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<AddPlayersModel>> get myordersDetailsListStream =>
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
      AddPlayersModel response =
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

///////////////////////////////////////


class HistoryBloc {
  historyRepositories? _myordersRepository;

  HistoryBloc({this.listener}) {
    if (_myordersRepository == null)
      _myordersRepository = historyRepositories();

    _myordersListController =
    StreamController<Response<AddPlayersModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<AddPlayersModel>>
  _myordersListController;

  StreamSink<Response<AddPlayersModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<AddPlayersModel>> get myordersDetailsListStream =>
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
      AddPlayersModel response =
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

/////////////////////////////////////////////////////////////////////////////////////////////


class ResultBloc {
  AddplayerRepository? _myresultRepository;

  ResultBloc({this.listener}) {
    if (_myresultRepository == null)
      _myresultRepository = AddplayerRepository();

    _myordersListController =
    StreamController<Response<ResultModelClass>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<ResultModelClass>>
  _myordersListController;

  StreamSink<Response<ResultModelClass>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<ResultModelClass>> get myordersDetailsListStream =>
      _myordersListController.stream;

  List<Results> myResultdetails = [];

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
      ResultModelClass response =
      await _myresultRepository!.getResultplayersRepository(20, pageNumber);
      // pageNumber = response.products!.total!;
      hasNextPage =
      response.lastPage! >= pageNumber.toInt() ? true : false;
      //pageNumber = !hasNextPage ? pageNumber - 1 : pageNumber;
      if (isPagination) {
        if (myResultdetails.length == 0) {
          myResultdetails = response.results!;
        } else {
          myResultdetails.addAll(response.results!);
        }
      } else {
        myResultdetails = response.results ?? [];
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