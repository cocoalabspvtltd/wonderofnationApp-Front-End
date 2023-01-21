import 'dart:async';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/club_details_model.dart';



class ClubDetailsRepository {

  Future  getclubdetailsList(int club_id) async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("clubs/details?club_id=${club_id}");

    final response = await WebApiProvider().getData(
        url: "clubs/details?club_id=${club_id}",
        isPost: false,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>${response}");

    return (response as List)
        .map((x) => ClubDetailsModel.fromJson(x))
        .toList();
  }
}


