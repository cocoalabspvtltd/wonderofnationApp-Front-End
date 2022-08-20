import 'dart:async';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/club_details_model.dart';



class ClubDetailsRepository {

  Future  getclubdetailsList(int club_id) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("clubs/details?club_id=${club_id}");
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "clubs/details?club_id=${club_id}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>${response}");

    return (response as List)
        .map((x) => ClubDetailsModel.fromJson(x))
        .toList();
  }
}
