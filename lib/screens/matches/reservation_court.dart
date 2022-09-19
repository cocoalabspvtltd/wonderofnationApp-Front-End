
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/reservation_court_bloc.dart';
import 'package:oo/apis/repositories/joined_clubs.dart';
import 'package:oo/screens/matches/public_court.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../apis/bloc/Coiurt_slot_bloc.dart';
import '../../apis/repositories/payment.dart';
import '../../apis/repositories/paymentcucesss.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/base_urls.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';
import 'add_players.dart';
import 'club_details.dart';
import 'court_time_slot.dart';

String ? razorpay_signature ="";String? PaymentId = "";

class ReservationCourt extends StatefulWidget {
  const ReservationCourt({Key? key, required this.club_id, required this.date, required this.ClubName,  required this.state, required this.city, }) : super(key: key);
final int club_id;
final String date;
final String ClubName;
  final String state;
  final String city;
  @override
  State<ReservationCourt> createState() => _ReservationCourtState();
}

class _ReservationCourtState extends State<ReservationCourt> {
  late ReservationCourtBloc _bloc;
  late CourtSlotBloc _courtSlotBloc;
 bool? isLoading;
  List book_model= ["Private", "Public"];
  int selectedIndex = -1;
   int price = 0;
   int courtid = 0;
   List<dynamic> patientappointmentsearchdata = [];
   List<dynamic> patientappointmentserachlist = [];

  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();

getTimeSlot(int courtId)async{

  setState(() {
    isLoading = true;
  });
 await _courtSlotBloc.getReservationCourtsDetailsList(widget.date, "private", courtId);
  setState(() {
    isLoading = false;
  });
}
  int selectedIndex2 = -1;

  int selectedIndex1 = -1;
  String buttontext="Book Now";

  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());

  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;

  @override
  bool value = false;
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index]["timeSlots"]}");
          return _tile(data[index]["courts"],data[index]["timeSlots"],data[index]["image"] );
        });
  }

  SizedBox _tile(
      List title, List slots,String image ) =>
      SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Selected date",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getFontSize(
                        16,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Container(
                      height: 40,
                      width: size.width,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Text(widget.date),
                      ),
                    )
                ),
                SizedBox(
                  height: 13,
                ),
                SizedBox(height: 3,),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 10),
                  child: Container(child: Text(widget.ClubName,style: TextStyle(fontSize: 18,color: ColorConstant.green6320),),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 10),
                  child: Container(child: Text("${widget.state}/ ${widget.city}",style: TextStyle(fontSize: 18,color: ColorConstant.green6320),),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 45,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10,);},
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: book_model.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 45,
                            width: 120,
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: ColorConstant.green6320,width: 0.6),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ListTile(
                                  selected: selectedIndex == index? true: false,
                                  selectedTileColor: ColorConstant.green6320,
                                  selectedColor:ColorConstant.whiteA700 ,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20,left:16),
                                    child: Text(book_model[index],style: TextStyle(
                                      color: selectedIndex == index ? Colors.white : Colors.black,),),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      print("selectedInex--->${ selectedIndex = index}");
                                    });
                                  },
                                )),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Select Court",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getFontSize(
                        16,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: SizedBox(
                    height: 45,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 7,
                          );
                        },
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: title.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 45,
                            width: 120,
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                color: ColorConstant.gray200,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: selectedIndex2 == index ? Colors.white : Colors.black,width: 0.1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ListTile(
                                  selected: selectedIndex2 == index? true: false,
                                  selectedTileColor: ColorConstant.green6320,
                                  selectedColor:ColorConstant.gray200 ,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: GestureDetector(onTap: ()async{
                                      selectedIndex2 = index;
                                      setState((){});
                                      await getTimeSlot(title[index]["id"]);
                                      setState(() {
                                        price = title[index]["price"];
                                        courtid = title[index]['id'];


                                      });
                                      //selectedIndex2 == index;
                                    },
                                      child: Text(title[index]["name"],style: TextStyle(
                                          color: selectedIndex2 == index ? Colors.white : Colors.black,fontSize: 15),),
                                    ),
                                  ),

                                )),
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      170.00,
                    ),
                    width: getHorizontalSize(
                      320.00,
                    ),
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                      top: 15
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            child:  CachedNetworkImage(
                              imageUrl: image,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset("assets/images/splash5.jpg",fit: BoxFit.fill,),
                              height: getVerticalSize(
                                400.00,
                              ),
                              width: getHorizontalSize(
                                360.00,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                isLoading ?? false ? Center(child:Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color:ColorConstant.green6320),),
                ))
                :Container(),
                StreamBuilder<Response<List<dynamic>>>(
                    stream: _courtSlotBloc.Court_clubDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print("sdfghjk");
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Container(
                              height: 20,
                              width: 20,
                              ); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                            break;
                          case Status.SUCCESS:
                            List<dynamic> patientappointmentList =
                                snapshot.data!.data;
                            patientappointmentsearchdata = patientappointmentList;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                timeSlotView(patientappointmentsearchdata),

                              ],
                            );

                            break;
                          case Status.ERROR:
                            return Container();
                        }
                      }
                      return Container();
                    }),

                SizedBox(
                  height: 10,
                ),




SizedBox(height: 20,),

              ],
            ),
          ),
        ),

      );
  Widget timeSlotView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index]["timeslots"]}");
          return timeTile(data[index]["timeslots"],data[index]["image"] );
        });
  }
  SizedBox timeTile(
      List slots,String image ) =>
      SizedBox(
        width: size.width,
        child:    Padding(
          padding: const EdgeInsets.only(left: 18,top: 20,right:18),
          child: SizedBox(
            height: 50,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: slots.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // height: 45,
                    width: 120,
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        color: ColorConstant.gray200,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: selectedIndex1 == index ? Colors.white : Colors.black,width: 0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          selected: selectedIndex1 == index? true: false,
                          selectedTileColor: ColorConstant.green6320,
                          selectedColor:ColorConstant.gray200 ,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(slots[index]["time"],style: TextStyle(
                                color: selectedIndex1 == index ? Colors.white : Colors.black,fontSize: 15),),
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex1 = index;
                            });
                          },
                        )),
                  );
                }),
          ),
        ),

      );



  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
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
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => ClubDetails(date: '', club_id:0,)));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Reserve Court",
              style: TextStyle(
                color: Colors.black,
                fontSize: getFontSize(
                  22,
                ),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        bottomSheet:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 6,
          child: Container(
            height:122,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "₹${price} ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                28,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "For one hour ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                15,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 110,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 40),
                        primary:  ColorConstant.green6320,
                        elevation: 2,
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(10.0)
                        ),),
                      onPressed: (){
                        openCheckout( );
                      },
                      child: Text(
                        buttontext,
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
                  ],
                ),
                SizedBox(height: 2,),
                if(selectedIndex==1)
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        value: this.value,
                        activeColor: ColorConstant.green6320,
                        onChanged: ( value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      SizedBox(width: 15),//SizedBox
                      Text(
                        'Do you want to hold this slot?',
                        style: TextStyle(fontSize: 12.0),
                      ), //Text
                      //SizedBox
                      //Checkbox
                    ], //<Widget>[]
                  ),
              ],
            ),
          ),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<Response<List<dynamic>>>(
                  stream: _bloc.ReservationCourtseDataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("sdfghjk");
                      switch (snapshot.data!.status) {
                        case Status.LOADING:
                          return Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color:ColorConstant.green6320),),
                          );// LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                          break;
                        case Status.SUCCESS:
                          List<dynamic> patientappointmentList =
                              snapshot.data!.data;
                          patientappointmentsearchdata = patientappointmentList;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              _jobsListView(patientappointmentsearchdata)
                            ],
                          );

                          break;
                        case Status.ERROR:
                          return  Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color:ColorConstant.green6320),),
                          );
                      }
                    }
                    return  Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color:ColorConstant.green6320),),
                    );
                  }),


            ],
          ),
        )
    );
  }
  String OrderId ="";
  late Razorpay _razorpay;
  Payemnt pay = Payemnt();
  PayemntSucess paysucess = PayemntSucess();
  void initState() {
    super.initState(); _bloc =ReservationCourtBloc(widget.club_id,widget.date);
    _courtSlotBloc = CourtSlotBloc(widget.date, "private",0);

    _razorpay = Razorpay();
    pay.getpaymentList();


   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  void openCheckout() async {

    var options = {
      'key': key,
      'order_id':Orderid,
      'amount': amount,
      'name':"WON",
      'description': 'Payment',
      'retry': {'enabled': true, 'max_count': 3},
      'send_sms_hash': true,
      'prefill': {'contact': phone, 'email': email,'name':name},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    PaymentId = response.paymentId;
     razorpay_signature = response.signature;

    print('Success Response: $response');
    print("sducessss");
paysucess.getpaymentsucessList(PaymentId!, Orderid,razorpay_signature );

    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
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