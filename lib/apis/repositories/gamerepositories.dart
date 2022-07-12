
import 'package:oo/apis/repositories/registerRepositories.dart';

import '../../constants/webApiprovider.dart';
import '../modelclass/sportmodel.dart';


class AppointmentMeasurmentDetailsRepository {
  Future getAppointmentMeasurmentEditDetails() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    final response = await WebApiProvider().getData(
        url: "get/sports",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false
    );

    print("res->>>>>>>>>${response}");
    return (response);
  }
}
