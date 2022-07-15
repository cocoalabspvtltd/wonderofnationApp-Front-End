import 'dart:async';


import '../../constants/response.dart';
import '../modelclass/registersportmodel.dart';
import '../modelclass/sportmodel.dart';
import '../repositories/gamerepositories.dart';
import '../repositories/registergame.dart';


class AppointmentMeasurmentDetailsBloc1 {
  AppointmentMeasurmentDetailsRepository1
  _appointmentmeasurmentDetailsRepository1 =
  new AppointmentMeasurmentDetailsRepository1();
  final _appointementmeasurmentdetailsListDataCntroller1 =
  StreamController<Response<List<AppointementmeasurmentModel1>>>();

  StreamSink<Response<List<AppointementmeasurmentModel1>>>
  get appointmentmeasurmentDetailsDataSink1 =>
      _appointementmeasurmentdetailsListDataCntroller1.sink;

  Stream<Response<List<AppointementmeasurmentModel1>>>
  get appointmentmeasurmentDetailsStream1 =>
      _appointementmeasurmentdetailsListDataCntroller1.stream;

  AppointmentMeasurmentDetailsBloc1() {
    _appointmentmeasurmentDetailsRepository1 =
        AppointmentMeasurmentDetailsRepository1();
    getappointemntmeasurmentList1();
    print("fsfds");
  }

  getappointemntmeasurmentList1() async {
    appointmentmeasurmentDetailsDataSink1.add(Response.loading('Fetching...'));
    try {
      List<AppointementmeasurmentModel1> _appointmentmeasuremntEditDetailsList1 =
      await _appointmentmeasurmentDetailsRepository1
          .getAppointmentMeasurmentEditDetails1();
      appointmentmeasurmentDetailsDataSink1
          .add(Response.success(_appointmentmeasuremntEditDetailsList1));
    } catch (e) {
      appointmentmeasurmentDetailsDataSink1.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementmeasurmentdetailsListDataCntroller1.close();
  }
}
