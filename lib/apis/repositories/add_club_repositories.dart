import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/add_club_modelclass.dart';


int club_id = 0;
class AddClubRepositories {

  Future  getaddclubList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "clubs/all-list",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    // club_id = response[3]["id"];

    print("res->>>${club_id}");
    return (response as List)
        .map((x) => AddClubModelclass.fromJson(x))
        .toList();
  }
}
class EditPlayerRepo {

  Future  getEditPlayer(int playeerID,user_id) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

      "player_id":9,
      "user_id":119,
      "player_name":"nima"
    };


    final response = await WebApiProvider().getData(
        url: "player/update",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    // club_id = response[3]["id"];

    print("res->>>${club_id}");
    return response;
  }
}
class Deleteplayer {

  Future  getDeleteplayer(int playerid,) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

      "player_id":playerid

    };

print("object->>>>>>>>>>>${_queryParameters}");
    final response = await WebApiProvider().getData(
        url: "player/delete",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    // club_id = response[3]["id"];

    if(response["success"]==true)Fluttertoast.showToast(msg: "Player deleted");
    return response;
  }
}
class UpdatePalyer {

  Future  getUpdateplayer(int userid,bookingid,String name,paymentatus) async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "user_id":userid,
      "booking_id":bookingid,
      "player_name":name,
      "payment_status":paymentatus

    };

    print("object->>>>>>>>>>>${_queryParameters}");
    final response = await WebApiProvider().getData(
        url: "player/store",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    // club_id = response[3]["id"];

    if(response["success"]==true)Fluttertoast.showToast(msg: "Player Addes");
    return response;
  }
}