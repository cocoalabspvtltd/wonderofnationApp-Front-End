import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/usersuggestionmodel.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';
import 'package:oo/apis/repositories/usersuggestionrepositories.dart';

import '../../constants/response.dart';
import '../modelclass/joinedclubModel.dart';
import '../repositories/joinedclublist.dart';

class UsersuggestionDetailsBloc {
  UserSuggestionRepository _UserSuggestionRepository = new UserSuggestionRepository();
  final _UserSuggestionDataController =
  StreamController<Response<List<UserSuggestionModel>>>();

  StreamSink<Response<List<UserSuggestionModel>>> get UserSuggestionDataSink =>
      _UserSuggestionDataController.sink;

  Stream<Response<List<UserSuggestionModel>>>? get UserSuggestionDataStream =>
      _UserSuggestionDataController.stream;

  UsersuggestionDetailsBloc() {
    _UserSuggestionRepository = UserSuggestionRepository();
    getMyClubsList();
    print("fsfds");
  }

  getMyClubsList() async {
    UserSuggestionDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<UserSuggestionModel> _joinedclublist =
    await _UserSuggestionRepository.getUsersuggestionList();

    UserSuggestionDataSink.add(Response.success(_joinedclublist));
    } catch (e) {
      UserSuggestionDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _UserSuggestionDataController.close();
  }
}
