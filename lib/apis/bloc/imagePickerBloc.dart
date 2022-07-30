// import 'dart:async';
//
//
// import '../../constants/response.dart';
// import '../modelclass/sportmodel.dart';
// import '../repositories/gamerepositories.dart';
// import '../repositories/imagepicker.dart';
//
//
// class ImagePickerBloc {
//   ImagePicker
//   _appointmentmeasurmentDetailsRepository =
//   new ImagePicker();
//   final _appointementmeasurmentdetailsListDataCntroller =
//   StreamController<Response<List<AppointementmeasurmentModel>>>();
//
//   StreamSink<Response<List<AppointementmeasurmentModel>>>
//   get appointmentmeasurmentDetailsDataSink =>
//       _appointementmeasurmentdetailsListDataCntroller.sink;
//
//   Stream<Response<List<AppointementmeasurmentModel>>>
//   get appointmentmeasurmentDetailsStream =>
//       _appointementmeasurmentdetailsListDataCntroller.stream;
//
//   AppointmentMeasurmentDetailsBloc() {
//     _appointmentmeasurmentDetailsRepository =
//         ImagePicker();
//     getappointemntmeasurmentList();
//     print("fsfds");
//   }
//
//   getappointemntmeasurmentList() async {
//     appointmentmeasurmentDetailsDataSink.add(Response.loading('Fetching...'));
//     try {
//       List<AppointementmeasurmentModel> _appointmentmeasuremntEditDetailsList =
//       await _appointmentmeasurmentDetailsRepository
//           .getAppointmentMeasurmentEditDetails();
//       appointmentmeasurmentDetailsDataSink
//           .add(Response.success(_appointmentmeasuremntEditDetailsList));
//     } catch (e) {
//       appointmentmeasurmentDetailsDataSink.add(Response.error(e.toString()));
//       print(e);
//     }
//   }
//
//   dispose() {
//     _appointementmeasurmentdetailsListDataCntroller.close();
//   }
// }
