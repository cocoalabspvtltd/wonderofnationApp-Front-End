

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/repositories/payment.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/screens/dashboardItems/creating_matches_screen.dart';
import 'package:oo/screens/homePage/home_page1.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/dashboardItems/my_matches.dart';
import '../../screens/matches/public_court.dart';
import '../../screens/matches/reservation_court.dart';
import '../../screens/dashboardItems/history_screen.dart';
String sucess ="";
String PendingSucess = "";
class PayemntSucess {

  Future  getpaymentsucessList(String razorpay_payment_id,razorpay_order_id ,razorpay_signature,context,String Pending) async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "razorpay_payment_id":PaymentId,
      "razorpay_order_id":Orderid,
      "razorpay_signature":razorpay_signature
    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "payment/signature-verify",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

     sucess = response["message"];

    //print("=>>>>>>>>>${response["message"] =""}");

   if (response["message"] =="Payment successful") {
     print("object");
     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMatches(fragmentToShow: 0, pendingamount: Pending,)));

     }

    return response;

  }

  Future  getPendingpaymentsucessList(String razorpay_payment_id,razorpay_order_id ,razorpay_signature,context, int playerid) async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "razorpay_payment_id":razorpay_payment_id,
      "razorpay_signature":razorpay_signature,
      "razorpay_order_id":razorpay_order_id,
      "player_id":playerid

    };
    print("_queryParameters : " + _queryParameters.toString());

    final response = await WebApiProvider().getData(
        url: "player/payment/signature-verify",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    PendingSucess = response["message"];
    if (response["message"]=="Payment successful"){
    Fluttertoast.showToast(msg: "Payment Completed");}
    else Fluttertoast.showToast(msg: "Payment Failed");

    return response;

  }
  _showDialog(
      BuildContext context,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor:Colors.white,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 60.0,
          ),
          elevation: 0.0,
          title: Column(children: [
            Container(height: 40,
              width: 40 ,
              child: Image.asset(
                "assets/images/tickmark.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "You are ready to play",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Payment Successfully Completed",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>    PaymentSuccess()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    40.00,
                  ),
                  width: getHorizontalSize(
                    235.00,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.green6320,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
                  ),
                  child: Text(
                    "ok ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.whiteA700,
                      fontSize: getFontSize(
                        17,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        );

      },
    );
  }
}
