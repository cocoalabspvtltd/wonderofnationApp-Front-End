import 'dart:async';

import 'package:oo/apis/modelclass/clubdetailsmodel.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/clubdetailsrepositories.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';

import '../../constants/response.dart';

class ClubDetailslistBloc {
  ClubDetailsRepository _ClubDetailsRepository = new ClubDetailsRepository();
  final _ClubDetailsDataController =
  StreamController<Response<List<ClubDetailsModel>>>();

  StreamSink<Response<List<ClubDetailsModel>>> get ClubDetailsListDataSink =>
      _ClubDetailsDataController.sink;

  Stream<Response<List<ClubDetailsModel>>>? get ClubDetailsDataStream =>
      _ClubDetailsDataController.stream;

  ClubDetailslistBloc(int club_id) {
    _ClubDetailsRepository = ClubDetailsRepository();
    getClubDetailsList(club_id);
    print("fsfds");
  }

  getClubDetailsList(int club_id) async {
    ClubDetailsListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<ClubDetailsModel> _ClubDetails =
    await _ClubDetailsRepository.getclubdetailsList(club_id);

    ClubDetailsListDataSink.add(Response.success(_ClubDetails));
    } catch (e) {
      ClubDetailsListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _ClubDetailsDataController.close();
  }
}
