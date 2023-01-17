

import 'dart:async';
import 'dart:math';
import '../../constants/response.dart';

import 'package:oo/apis/modelclass/matchdescription_modelk.dart';
import 'package:oo/apis/repositories/matchdepertment_repo.dart';

class PackagesBlocUser {
  late DepartmentRepositoryUser _repository;
  late StreamController<Response<MatchDescriptionModel>>
  _allPackgesController;

  StreamSink<Response<MatchDescriptionModel>>? get allPackagesSink =>
      _allPackgesController.sink;

  Stream<Response<MatchDescriptionModel>> get allPackagesStream =>
      _allPackgesController.stream;

  PackagesBlocUser() {
    _repository = DepartmentRepositoryUser();
    _allPackgesController =
        StreamController<Response<MatchDescriptionModel>>();
  }

  getAllPackagesList(int id) async {
    allPackagesSink!.add(Response.loading('Fetching profile'));
    try {
      MatchDescriptionModel packagesResponse =
      await _repository.getAllDepartmentList(id);
      if (packagesResponse.success == true) {
        allPackagesSink!.add(Response.completed(packagesResponse));
      } else {
        allPackagesSink!.add(Response.error(
            packagesResponse.message ?? "Something went wrong"));
      }
    } catch (error) {
      allPackagesSink!.
      add(Response.error(e.toString()));
    }
  }



  dispose() {
    allPackagesSink?.close();
    _allPackgesController.close();
  }
}
