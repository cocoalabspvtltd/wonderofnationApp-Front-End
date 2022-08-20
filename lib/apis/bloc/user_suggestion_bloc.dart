import 'dart:async';

import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/modelclass/user_suggestion_model.dart';
import 'package:oo/apis/repositories/club_list_repositories.dart';
import 'package:oo/apis/repositories/user_suggestion_repositories.dart';



import '../../constants/response.dart';
import '../modelclass/joined_club_Model.dart';
import '../repositories/joined_clublist.dart';

class UserSuggestionDetailsBloc {
  UserSuggestionRepository _UserSuggestionRepository = new UserSuggestionRepository();
  final _UserSuggestionDataController =
  StreamController<Response<List<UserSuggestionModel>>>();

  StreamSink<Response<List<UserSuggestionModel>>> get UserSuggestionDataSink =>
      _UserSuggestionDataController.sink;

  Stream<Response<List<UserSuggestionModel>>>? get UserSuggestionDataStream =>
      _UserSuggestionDataController.stream;

  UserSuggestionDetailsBloc() {
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
