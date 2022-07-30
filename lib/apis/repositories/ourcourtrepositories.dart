import 'dart:async';
import 'package:oo/apis/repositories/registerRepositories.dart';
import '../../constants/webApiprovider.dart';
import '../modelclass/clubdetailsmodel.dart';
import '../modelclass/ourcourtimage.dart';


class OurCourtsRepository {

  Future  getcourtimageList(int club_id) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "clubs/our/courts?club_id=${club_id}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");

    return (response as List)
        .map((x) => OurCourtsImage.fromJson(x))
        .toList();
  }
}
