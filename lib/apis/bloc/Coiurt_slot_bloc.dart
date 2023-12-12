import 'dart:async';
import '../../constants/response.dart';
import '../repositories/Court_slotRepositories.dart';
import '../repositories/reservation_court_repositories.dart';

class CourtSlotBloc {
  Court_clubRepository _court_clubRepository = new Court_clubRepository();
  final _Court_clubDataController =
  StreamController<Response<List<dynamic>>>.broadcast();

  StreamSink<Response<List<dynamic>>> get Court_clubListDataSink =>
      _Court_clubDataController.sink;

  Stream<Response<List<dynamic>>>? get Court_clubDataStream =>
      _Court_clubDataController.stream;

  CourtSlotBloc(String date,int method,int courtId,) {
    _court_clubRepository = Court_clubRepository();
    getReservationCourtsDetailsList(date, method ,courtId);
    print("fsfds");
  }

  getReservationCourtsDetailsList(String date,int method, int courtId, ) async {
    Court_clubListDataSink.add(Response.loading('Fetching...'));
    try {
      print("object");
    List<dynamic> _reservationcourt =
    await _court_clubRepository.getcourtclubList(date,method, courtId);

    Court_clubListDataSink.add(Response.success(_reservationcourt));
    } catch (e) {
      Court_clubListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _Court_clubDataController.close();
  }
}
