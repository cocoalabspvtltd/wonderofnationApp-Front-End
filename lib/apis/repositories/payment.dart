
import 'dart:core';


import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/screens/matches/add_players.dart';

import '../../constants/base_urls.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/matches/reservation_court.dart';
String Orderid ="";
String key ="";
String amounts ="";
String refferel = "";
String PendingOrderid  = "";

String Pendingkey ="";
String PEndingpayName = "";
String PendingEmail = '';
String PendingPayAmount ="";


class Payemnt {
  WebApiProvider apiProvider= WebApiProvider();
  Future  getpaymentList( int court_id,type,String date, int time_slot,amount) async {
    final format = DateFormat("dd-MM-yyyy");
    DateTime gettingDate = format.parse( date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(gettingDate);
    print("formatted-<>>>>>>>${court_id}");
    int i =0;
    List<Map> playerData =[];
    forAddPlayers.forEach((element) {
      print ("check->${check}");
      playerData.add({"player_name":element["name"],"user_id":element["id"],"payment_status":isChecked[i]});

      i+=1;
    });
    print("hold_court ${holdSlotvalue}");
    print("courtid ${court_id}, "
        "selectedIndex $type,"
        "date ${date}, "
        "TimeId ${time_slot}, "
        "ammount ${amount},"
        "hol ${holdSlotvalue},"
        "players ${playerData}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "court_id":court_id,
      "type":type,
      "date": formatted,
      "time_slot_id":time_slot,
      "amount":amount,
      "hold_court":holdSlotvalue,
      "players": addplayersvalue==true? playerData:null,
    };
    print("court/payment");
    print("_queryParameters : " + _queryParameters.toString());
    final response = await WebApiProvider().getData(
        url:"court/payment",
        isPost: true,
        token: UserDetails.apiToken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("res->>>--------${response}");
    Orderid= response["order_id"];
    key =response["key"];
    amounts = response["amount"].toString();
    refferel = response["referral_code"];

    print("refferel->>>${refferel}");
    return response;
  }
  Future getpendingpayment(int playerid,String amount) async {

    FormData formData = FormData.fromMap({
      "player_id":playerid,
      "amount":amount,
    });
    print("99${formData.fields}");
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"player/payment",
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )

    );
    Pendingkey = response.data["key"];
    PendingOrderid = response.data["order_id"];
    PendingEmail = response.data['email'];
    PEndingpayName = response.data["name"];
    PendingPayAmount = response.data["amount"].toString();
    print("=>${response.data["key"]}");
    return response.data;

  }
}






