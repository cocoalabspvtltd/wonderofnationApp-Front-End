import 'dart:async';
import 'dart:math';

import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/modelclass/user_suggestion_model.dart';
import 'package:oo/apis/repositories/club_list_repositories.dart';
import 'package:oo/apis/repositories/user_suggestion_repositories.dart';



import '../../constants/response.dart';
import '../../elements/LoadMoreListener.dart';
import '../modelclass/joined_club_Model.dart';
import '../repositories/joined_clublist.dart';


class UserSuggestionDetailsBloc {
  UserSuggestionRepository? _myresultRepository;

  UserSuggestionDetailsBloc({this.listener}) {

    if (_myresultRepository == null)
      _myresultRepository = UserSuggestionRepository();

    _myordersListController =
    StreamController<Response<UserSuggestionModel>>.broadcast();
  }

  bool hasNextPage = false;
  int pageNumber = 1;
  int perPage = 20;

  LoadMoreListener? listener;

  late StreamController<Response<UserSuggestionModel>>
  _myordersListController;

  StreamSink<Response<UserSuggestionModel>>? get myordersDetailsListSink =>
      _myordersListController.sink;

  Stream<Response<UserSuggestionModel>> get myordersDetailsListStream =>
      _myordersListController.stream;

  List<Users> myResultdetails = [];

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
      UserSuggestionModel response =
      await _myresultRepository!.getUsersuggestionList(20, pageNumber);
      // pageNumber = response.products!.total!;
      hasNextPage =
      response.lastPage! >= pageNumber.toInt() ? true : false;
      //pageNumber = !hasNextPage ? pageNumber - 1 : pageNumber;
      if (isPagination) {
        if (myResultdetails.length == 0) {
          myResultdetails = response.users!;
        } else {
          myResultdetails.addAll(response.users!);
        }
      } else {
        myResultdetails = response.users ?? [];
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