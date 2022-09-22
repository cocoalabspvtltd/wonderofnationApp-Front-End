
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import '../payment_dash/payment_page.dart';
import 'add_players.dart';
import 'club_details.dart';
import 'court_time_slot.dart';

String ? razorpay_signature ="";String? PaymentId = "";
String ?OrderRazorpayId ="";

class ReservationCourt extends StatefulWidget {
  const ReservationCourt({Key? key, required this.club_id, required this.date, required this.ClubName,  required this.state, required this.city, }) : super(key: key);
  final int club_id;
  final String date;
  final String ClubName;
  final String state;
  final String city;
  final int Timeid = 0;

  @override
  State<ReservationCourt> createState() => _ReservationCourtState();
}

class _ReservationCourtState extends State<ReservationCourt> {
  late ReservationCourtBloc _bloc;
  late CourtSlotBloc _courtSlotBloc;
  bool? isLoading;
  List book_model= ["Private", "Public"];
  int selectedIndex = -1;
  int slot = 0;
  int price = 0;
  String y = "";

  int courtid = 0;

  int TimeId = 0;

  List<dynamic> patientappointmentsearchdata = [];
  List<dynamic> patientappointmentserachlist = [];

  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();


  getTimeSlot(int courtId)async{

    setState(() {
      isLoading = true;
    });
    await _courtSlotBloc.getReservationCourtsDetailsList(widget.date, selectedIndex, courtId);
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
                                        print("tfgh");

                                        price = title[index]["price"];
                                        courtid = title[index]['id'];
                                        slot = title[index]["slots"];

                       double x = (price/slot);
                                        y = x.toStringAsFixed(0);
                                        print("y ->>>>>>>.${y}");
                       //


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
          return timeTile(data[index]["timeslots"],data[index]["image"],
          );
        });
  }
  SizedBox timeTile(
      List slots,String image,) =>
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
                  TimeId= slots[index]["id"];
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Text(slots[index]["time"],style: TextStyle(
                                    color: selectedIndex1 == index ? Colors.white : Colors.black,fontSize: 15),),
                                selectedIndex==1? Text( "${slots[index]["available_slots"].toString()} left",style: TextStyle(
                                    color: selectedIndex1 == index ? Colors.white : Colors.black,fontSize: 9,fontWeight: FontWeight.bold),)
                                    :(SizedBox(height:0))
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex1 = index;
                              //  TimeId= slots[index]["id"];
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
    // print("json->>>>>>>>>>>${  (price/slot).floor()}");


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
                        if(selectedIndex==1)
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child:Text(
                                "₹${y}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    28,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                          ),
                        if(selectedIndex==0)
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child:Text(
                                "₹${price}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    28,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                          ),
                        if(selectedIndex==0)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child:Text(
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
                        if(selectedIndex==1)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "For Each One",
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
                      onPressed: ()async{
                        await  pay.getpaymentList(courtid,selectedIndex,widget.date,TimeId,price);

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
                      SizedBox(width: 0),//SizedBox
                      Text(
                        'Do you want to hold this slot?',
                        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
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
  bool pressed = false;
  String orderPlace = "";
  String PlaceOrder = "Place Order";
  void initState() {
    super.initState();
   _bloc =ReservationCourtBloc(widget.club_id,widget.date);
    _courtSlotBloc = CourtSlotBloc(widget.date, selectedIndex,0,);
    _razorpay = Razorpay();


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
    OrderRazorpayId = response.orderId;

    paysucess.getpaymentsucessList(PaymentId!, Orderid,razorpay_signature );
    sucess =="Payment successful"?showAlertDialog:SizedBox(height: 0,);
print("dfv");

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

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("REFFEREL"),
      content: Text("${refferel}"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> getpaymentsucessList(String razorpay_payment_id,razorpay_order_id ,razorpay_signature) async {

    var response = await http.post(
        Uri.parse("https://d917-59-98-51-52.ngrok.io/api/payment/signature-verify"),
        body: { "razorpay_payment_id":PaymentId,
          "razorpay_order_id":Orderid,
          "razorpay_signature":razorpay_signature});
    print(response.statusCode);
    print("response${response.body}");
    if (response.statusCode == 200) {
      // OrderSuccess();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OrderPlaced()),
      );
    }
  }

}
