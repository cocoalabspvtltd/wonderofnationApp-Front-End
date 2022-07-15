import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';

import '../../constants/response.dart';
import '../modelclass/joinedclubModel.dart';
import '../repositories/joinedclublist.dart';

class MyClubDetailsBloc {
  MyClubRepository _MyClubRepository = new MyClubRepository();
  final _MyClubDataController =
  StreamController<Response<List<JoinedClubModel>>>();

  StreamSink<Response<List<JoinedClubModel>>> get MyClubListDataSink =>
      _MyClubDataController.sink;

  Stream<Response<List<JoinedClubModel>>>? get MyClubDataStream =>
      _MyClubDataController.stream;

  MyClubDetailsBloc() {
    _MyClubRepository = MyClubRepository();
    getMyClubsList();
    print("fsfds");
  }

  getMyClubsList() async {
    MyClubListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<JoinedClubModel> _joinedclublist =
    await _MyClubRepository.getMyclubList();

    MyClubListDataSink.add(Response.success(_joinedclublist));
    } catch (e) {
      MyClubListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _MyClubDataController.close();
  }
}
