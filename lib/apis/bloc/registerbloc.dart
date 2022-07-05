// import 'dart:async';
//
//
// import 'package:oo/apis/modelclass/RegisterModel.dart';
// import 'package:oo/apis/repositories/registerRepositories.dart';
//
// import '../../constants/response.dart';
//
// class LabTestListBloc {
//   RegisterRepository _registerListRepository = new RegisterRepository();
//   final _registerListDataController =
//   StreamController<Response<List<RegisterModel>>>();
//
//   StreamSink<Response<List<RegisterModel>>> get labListDataSink =>
//       _registerListDataController.sink;
//
//   Stream<Response<List<RegisterModel>>>? get labtestDataStream =>
//       _registerListDataController.stream;
//
//   LabTestListBloc() {
//     _registerListRepository = RegisterRepository();
//     getlabList();
//     print("fsfds");
//   }
//
//   getlabList() async {
//     labListDataSink.add(Response.loading('Fetching...'));
//     try {
//       List<RegisterModel> _registerdataList =
//       await _registerListRepository.getlabTest();
//       labListDataSink.add(Response.success(_registerdataList));
//     } catch (e) {
//       labListDataSink.add(Response.error(e.toString()));
//       print(e);
//     }
//   }
//
//   dispose() {
//     _registerListDataController.close();
//   }
// }
