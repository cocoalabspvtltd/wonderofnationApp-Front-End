import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:oo/apis/bloc/addplayer_bloc.dart';
import 'package:oo/apis/bloc/myplayerbloc.dart';
import 'package:http/http.dart' as http;
import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/apis/repositories/joined_clubs.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/screens/dashboardItems/addplayersformatches.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import 'package:oo/screens/matches/public_court.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../apis/repositories/add_club_repositories.dart';
import '../../apis/repositories/payment.dart';
import '../../apis/repositories/paymentcucesss.dart';
import '../../constants/colors.dart';
import '../../constants/response.dart';
import '../matches/reservation_court.dart';

String? PendingPayrazorpay_signature = "";
String? PendingPaymentId = "";
String? PendingOrderRazorpayId = "";
List<Map<String, String>> forAddPlayers = [];

class AddMatchPlayers extends StatefulWidget {
  AddMatchPlayers({Key? key,required this.Amount,required this.PaymentDone,required this.Nopaycount,required this.bookingid}) : super(key: key);
String Amount;
String PaymentDone;
String Nopaycount;
String? bookingid;



  @override
  State<AddMatchPlayers> createState() => _AddMatchPlayersState();
}

class _AddMatchPlayersState extends State<AddMatchPlayers> {
  myplayerbloc? _bloc;

  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  Payemnt pendingPayment = Payemnt();
  EditPlayerRepo Upadateplayer = EditPlayerRepo();
  Deleteplayer DeletePlayer = Deleteplayer();
  PayemntSucess PendingPeyment = PayemntSucess();
  int playerid = 0;
  late Razorpay _razorpay;


  void initState() {
    super.initState();
    _bloc = myplayerbloc();
    _bloc?.getmyordersDetailsList(false);
    Payemnt();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    print("forAddPlayers-.${forAddPlayers}");
  }

  void openCheckout() async {
    var options = {
      'key': Pendingkey,
      'order_id': PendingOrderid,
      'amount': PendingPayAmount.toString(),
      'name': "WON",
      'description': 'Payment',
      'retry': {'enabled': true, 'max_count': 3},
      'send_sms_hash': true,
      'prefill': {
        'contact': "9090909909",
        'email': PendingEmail,
        'name': PEndingpayName
      },
      'external': {
        'wallets': ['paytm']
      },
      "theme": {
        "color": "#1D6320"
      }
    };
    print("options->${options}");
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    PendingPaymentId = response.paymentId;
    PendingPayrazorpay_signature = response.signature;
    print("=>>${response.signature}");
    PendingOrderRazorpayId = response.orderId;
    PendingPeyment.getPendingpaymentsucessList(
        PendingPaymentId!, PendingOrderRazorpayId, PendingPayrazorpay_signature,
        context, playerid);

    // selectedIndex == 1? showAlertDialogrefferel(context):Container();

  }

  getMyclubList() {
    _bloc?.getmyordersDetailsList(true);
  }


  @override
  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
     print(widget.bookingid);
     print(widget.PaymentDone);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.indigo,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Players List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )),
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Add Players", style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            FloatingActionButton(backgroundColor: Colors.green[900],
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AddPlayersforMatchplayer(bookingid:widget.bookingid,paymentstatus:widget.PaymentDone)));

                // Add your onPressed code here!
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 8,
                    ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  print("data->>>>>>${datas[index].name}");
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1,
                    child: Card(
                      elevation: 0,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/user2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.03,
                          ),
                          Text(
                            "${datas[index].name}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          datas[index].paymentStatus == "0"  && widget.PaymentDone != "paid"? TextButton(
                              onPressed: () async {
                                playerid = datas[index].playerId!;
                                await pendingPayment.getpendingpayment(
                                    playerid, widget.Amount);
                                openCheckout();
                              },
                              child: Text(
                                "Pay",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )) : Text(""),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.0,
                          ),
                          TextButton(
                              onPressed: () {
                                DeletePlayer.getDeleteplayer(
                                    datas[index].playerId!, context);
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16),
                              )),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.01,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
    );
  }
//   Future<void> getPendingpaymentsucessList(
//       String razorpay_payment_id, razorpay_order_id, razorpay_signature,playerid) async {
//     var response = await http.post(
//         Uri.parse(
//             "https://wonderofnation.com/WonderOfNations/public/api/player/payment/signature-verify"),
//         body: {
//           "razorpay_payment_id": razorpay_payment_id,
//           "razorpay_order_id":razorpay_order_id ,
//           "razorpay_signature": razorpay_signature,
//           "player_id":playerid
//
//         });
//     print(response.statusCode);
//     print("response${response.body}");
//     if (response.statusCode == 200) {
//       // OrderSuccess();
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => OrderPlaced()),
//       // );
//     }
//   }
// }
}