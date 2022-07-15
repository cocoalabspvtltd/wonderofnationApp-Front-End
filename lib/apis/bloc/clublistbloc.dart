import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';

import '../../constants/response.dart';

class ClubDetailsBloc {
  ClubRepository _vitalsignRepository = new ClubRepository();
  final _vitalsignDataController =
  StreamController<Response<List<ClubModel>>>();

  StreamSink<Response<List<ClubModel>>> get vitalsignListDataSink =>
      _vitalsignDataController.sink;

  Stream<Response<List<ClubModel>>>? get vitalsignDataStream =>
      _vitalsignDataController.stream;

  ClubDetailsBloc() {
    _vitalsignRepository = ClubRepository();
    getvitalsignList();
    print("fsfds");
  }

  getvitalsignList() async {
    vitalsignListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
      List<ClubModel> _vitallist =
      await _vitalsignRepository.getclubList();

      vitalsignListDataSink.add(Response.success(_vitallist));
    } catch (e) {
      vitalsignListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vitalsignDataController.close();
  }
}
