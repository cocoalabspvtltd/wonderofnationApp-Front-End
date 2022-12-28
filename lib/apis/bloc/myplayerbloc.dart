import 'dart:async';
import 'dart:math';

import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/apis/repositories/appplayers_repositories.dart';
import 'package:oo/apis/repositories/myboookingrepo.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';

class myplayerbloc {
  AddplayerRepository? _myplayerRepository;

  myplayerbloc({this.listener}) {
    if (_myplayerRepository == null)
      _myplayerRepository = AddplayerRepository();

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

  Stream<Response<AddPlayersModel>> get myplayerDetailsListStream =>
      _myordersListController.stream;

  List<Players> myplayerDetailsList = [];

  getmyordersDetailsList(bool isPagination, {int? perPage}) async {

    if (isPagination) {

      pageNumber = pageNumber + 1;
      listener?.refresh(true);

      print("page number=========" + pageNumber.toString());
    } else {
      myordersDetailsListSink!.add(Response.loading('Fetching Data'));
      pageNumber = 1;
      myordersDetailsListSink!.add(Response.loading('Fetching items'));
    }
    try {
      AddPlayersModel response =
      await _myplayerRepository!.getAddplayersRepository(88, pageNumber);
 pageNumber = response.total!;
      hasNextPage =
      response.lastPage! >= pageNumber.toInt() ? true : false;
      pageNumber = !hasNextPage ? pageNumber - 1 : pageNumber;
      if (isPagination) {
        if (myplayerDetailsList.length == 0) {
          myplayerDetailsList = response.players!;
          print("myplayer=>${myplayerDetailsList}");
        } else {
          myplayerDetailsList.addAll(response.players!);
        }
      } else {
        myplayerDetailsList = response.players ?? [];
      }
      myordersDetailsListSink!.add(Response.completed(response));
      if (isPagination) {
        listener?.refresh(false);
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
