import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/profilemodel.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';

import '../../constants/response.dart';
import '../repositories/profilepagerepositories.dart';

class profilepageBloc {
  ProfilepageRepositories _profileRepository = new ProfilepageRepositories();
  final _profileDataController =
  StreamController<Response<List<ProfileModelClass>>>();

  StreamSink<Response<List<ProfileModelClass>>> get profileListDataSink =>
      _profileDataController.sink;

  Stream<Response<List<ProfileModelClass>>>? get profileDataStream =>
      _profileDataController.stream;

  profilepageBloc() {
    _profileRepository = ProfilepageRepositories();
    getprofilesList();
    print("fsfds");
  }

  getprofilesList() async {
    profileListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<ProfileModelClass> _vitallist =
    await _profileRepository.getprofileList();

    profileListDataSink.add(Response.success(_vitallist));
    } catch (e) {
      profileListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _profileDataController.close();
  }
}
