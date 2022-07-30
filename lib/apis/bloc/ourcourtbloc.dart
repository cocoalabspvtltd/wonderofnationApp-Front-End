import 'dart:async';

import 'package:oo/apis/modelclass/clubdetailsmodel.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/ourcourtimage.dart';
import 'package:oo/apis/repositories/clubdetailsrepositories.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';
import 'package:oo/apis/repositories/ourcourtrepositories.dart';

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
