import 'dart:async';

import 'package:oo/apis/modelclass/club_details_model.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/modelclass/our_court_image.dart';
import 'package:oo/apis/repositories/club_details_repositories.dart';
import 'package:oo/apis/repositories/club_list_repositories.dart';
import 'package:oo/apis/repositories/our_court_repositories.dart';

import '../../constants/response.dart';




class OurCourtsBloc {
  OurCourtsRepository _OurCourtsRepository = new OurCourtsRepository();
  final _OurCourtsDataController =
  StreamController<Response<List<OurCourtsImage>>>();

  StreamSink<Response<List<OurCourtsImage>>> get OurCourtsImageListDataSink =>
      _OurCourtsDataController.sink;

  Stream<Response<List<OurCourtsImage>>>? get OurCourtsImageDataStream =>
      _OurCourtsDataController.stream;

  OurCourtsBloc(int club_id) {
    _OurCourtsRepository = OurCourtsRepository();
    getClubDetailsList(club_id);
    print("fsfds");
  }

  getClubDetailsList(int club_id) async {
    OurCourtsImageListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<OurCourtsImage> _imagecourt =
    await _OurCourtsRepository.getcourtimageList(club_id);

    OurCourtsImageListDataSink.add(Response.success(_imagecourt));
    } catch (e) {
      OurCourtsImageListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _OurCourtsDataController.close();
  }
}
