
import 'package:intl/intl.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/screens/matches/add_players.dart';

import '../../constants/web_Api_provider.dart';
import '../../screens/matches/reservation_court.dart';
String Orderid ="";
String key ="";
String amounts ="";
String refferel = "";
class Payemnt {

  Future  getpaymentList( int court_id,type,String date, int time_slot,amount) async {
    final format = DateFormat("dd-MM-yyyy");
    DateTime gettingDate = format.parse( date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(gettingDate);
  //  print("formatted-<>>>>>>>${playerid}");
int i =0;
          List<Map> playerData =[];
              forAddPlayers.forEach((element) {
                playerData.add({"player_name":element["name"],"user_id":element["id"],"payment_status":isChecked[i]});
                     i++;
                                          });
     final Map<String, dynamic> _queryParameters = <String, dynamic>

    {
        "court_id":court_id,
        "type":type,
        "date": formatted,
        "time_slot_id":time_slot,
        "amount":amount,
        "hold_court":holdSlotvalue,
        "players": addplayersvalue==true?
       playerData:null,
    };
    print("court/payment");
    print("_queryParameters : " + _queryParameters.toString());
    final response = await WebApiProvider().getData(
        url:"court/payment",
        isPost: true,
        token: TOKEN,
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
}






