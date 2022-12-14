import 'dart:async';

import 'package:oo/apis/modelclass/addplayers_model.dart';
import 'package:oo/apis/modelclass/club_details_model.dart';
import 'package:oo/apis/repositories/appplayers_repositories.dart';
import 'package:oo/apis/repositories/club_details_repositories.dart';

import '../../constants/response.dart';


class AddPlayersBloc {
  AddplayerRepository _AddplayerRepository = new AddplayerRepository();
  final _AddplayerDataController =
  StreamController<Response<AddPlayersModel>>();

  StreamSink<Response<AddPlayersModel>> get AddPlayersDataSink =>
      _AddplayerDataController.sink;

  Stream<Response<AddPlayersModel>>? get AddPlayersStream =>
      _AddplayerDataController.stream;

  AddPlayersBloc() {
    _AddplayerRepository = AddplayerRepository();
 //   getMyClubsList();
    print("fsfds");
  }

  getMyClubsList() async {
    AddPlayersDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    AddPlayersModel? _joinedclublist =
    await _AddplayerRepository.getAddplayersRepository();
    print("joinedclublist->>>>>>${_joinedclublist!.players![1].name}");

    AddPlayersDataSink.add(Response.success(_joinedclublist!));
    } catch (e) {
      AddPlayersDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _AddplayerDataController.close();
    AddPlayersDataSink.close();
  }
}

