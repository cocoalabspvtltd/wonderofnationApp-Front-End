import 'dart:async';
import 'package:oo/apis/modelclass/add_club_modelclass.dart';
import 'package:oo/apis/repositories/add_club_repositories.dart';

import '../../constants/response.dart';


class AddClubListBloc {
  AddClubRepositories _addclublistRepository = new AddClubRepositories();
  final _addclublistDataController =
  StreamController<Response<List<AddClubModelclass>>>();

  StreamSink<Response<List<AddClubModelclass>>> get addclublistDataSink =>
      _addclublistDataController.sink;

  Stream<Response<List<AddClubModelclass>>>? get addclublistDataStream =>
      _addclublistDataController.stream;

  AddClubListBloc() {
    _addclublistRepository = AddClubRepositories();
    getvitalsignList();
    print("fsfds");
  }

  getvitalsignList() async {
    addclublistDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<AddClubModelclass> _addclublist =
    await _addclublistRepository.getaddclubList();

    addclublistDataSink.add(Response.success(_addclublist));
    } catch (e) {
      addclublistDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _addclublistDataController.close();
  }
}
