import 'dart:async';

import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/invoice_model.dart';
import 'package:oo/apis/repositories/InvoiceRepository.dart';
import 'package:oo/apis/repositories/clublistrepositories.dart';

import '../../constants/response.dart';
import '../modelclass/joinedclubModel.dart';
import '../repositories/joinedclublist.dart';

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
