import 'dart:async';

import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/modelclass/InvoiceModel.dart';
import 'package:oo/apis/repositories/Invoice_Repository.dart';

import '../../constants/response.dart';


class InvoiceBLOC {
  InvoiceRepository _InvoiceRepository = new InvoiceRepository();
  final _InvoiceDataController =
  StreamController<Response<List<InvoiceModelClass>>>();

  StreamSink<Response<List<InvoiceModelClass>>> get InvoiceListDataSink =>
      _InvoiceDataController.sink;

  Stream<Response<List<InvoiceModelClass>>>? get InvoiceDataStream =>
      _InvoiceDataController.stream;

  InvoiceBLOC() {
    _InvoiceRepository = InvoiceRepository();
    getMyClubsList();
    print("fsfds");
  }

  getMyClubsList() async {
    InvoiceListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<InvoiceModelClass> _joinedclublist =
    await _InvoiceRepository.getinvoiceList();

    InvoiceListDataSink.add(Response.success(_joinedclublist));
    } catch (e) {
      InvoiceListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _InvoiceDataController.close();
  }
}
