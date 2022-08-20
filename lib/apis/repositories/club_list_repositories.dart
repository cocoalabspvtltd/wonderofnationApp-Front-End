import 'dart:async';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/dropdowns/games_dropdown.dart';
import '../../screens/dropdowns/register_game_dropdown.dart';



int club_id = 0;
class ClubRepository {

  Future  getclubList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("_queryParameters : " + _queryParameters.toString());
    print("clubs/list/app?location=${Locationid}&spot=${designatioids}");
    final response = await WebApiProvider().getData(
        url: "clubs/list/app?location=${Locationid}&spot=${designatioids}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
       // club_id = response[3]["id"];

        print("res->>>${club_id}");
        return (response as List)
        .map((x) => ClubModel.fromJson(x))
        .toList();
  }
}
