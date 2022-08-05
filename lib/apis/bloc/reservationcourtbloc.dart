import 'dart:async';
import '../../constants/response.dart';
import '../repositories/reservationcourtrepositories.dart';

class ReservationCourtBloc {
  ReservationRepository _ReservationCourtsRepository = new ReservationRepository();
  final _ReservationCourtsDataController =
  StreamController<Response<List<dynamic>>>();

  StreamSink<Response<List<dynamic>>> get ReservationCourtsListDataSink =>
      _ReservationCourtsDataController.sink;

  Stream<Response<List<dynamic>>>? get ReservationCourtseDataStream =>
      _ReservationCourtsDataController.stream;

  ReservationCourtBloc(int club_id,String date) {
    _ReservationCourtsRepository = ReservationRepository();
    getReservationCourtsDetailsList( club_id , date);
    print("fsfds");
  }

  getReservationCourtsDetailsList( int club_id,String date) async {
    ReservationCourtsListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<dynamic> _reservationcourt =
    await _ReservationCourtsRepository.getreservationclubList(club_id,date);

    ReservationCourtsListDataSink.add(Response.success(_reservationcourt));
    } catch (e) {
      ReservationCourtsListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _ReservationCourtsDataController.close();
  }
}
