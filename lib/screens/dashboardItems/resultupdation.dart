import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/matchdescription_modelk.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/screens/matches/add_players.dart';
import 'package:oo/screens/profile/edit_profile.dart';
import '../../apis/bloc/matchdescriptionbloc.dart';
import '../../apis/modelclass/club_details_model.dart';
import '../../constants/response.dart';
import 'add_match_players.dart';
import 'my_matches.dart';
List<PlayersupcomingPlayers> datas =[];
class ResultUpdation extends StatefulWidget {
  ResultUpdation({Key? key,required }) : super(key: key);
  // int id ;
  // String pendingamount;
  // String nopaycount;
  @override
  State<ResultUpdation> createState() => _ResultUpdationState();
}

class _ResultUpdationState extends State<ResultUpdation> {
  @override
  PackagesBlocUser? _bloc;

  void initState() {
    super.initState();

    _bloc =PackagesBlocUser();
   // _bloc?.getAllPackagesList(widget.id);

    setState(() {});
  }
  int count = 0;
  String paymentDone="";

  TextEditingController searchcontroller = new TextEditingController();
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());


  Widget build(BuildContext context) {
  //  print(widget.pendingamount);
    return Scaffold(
        backgroundColor: Colors.white,
        body:   Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: ColorConstant.gray400,
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: getVerticalSize(
                    450.00,
                  ),
                  width: size.width,
                  margin: EdgeInsets.only(
                    bottom: getVerticalSize(
                      10.00,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/football.jpg",
                          height: getVerticalSize(
                            450.00,
                          ),
                          width: getHorizontalSize(
                            360.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          top:30,
                          left:15,child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '',)));
                      }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,))),

                    ],
                  ),

                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    top: getVerticalSize(
                      1.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        getHorizontalSize(
                          40.00,
                        ),
                      ),
                      topRight: Radius.circular(
                        getHorizontalSize(
                          40.00,
                        ),
                      ),
                      bottomLeft: Radius.circular(
                        getHorizontalSize(
                          0.00,
                        ),
                      ),
                      bottomRight: Radius.circular(
                        getHorizontalSize(
                          0.00,
                        ),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            50.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: getHorizontalSize(
                                162.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  30.00,
                                ),
                              ),
                              child: Text(
                                "clubName",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    24,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            37.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  33.33,
                                ),
                                top: getVerticalSize(
                                  4.67,
                                ),
                                bottom: getVerticalSize(
                                  11.66,
                                ),
                              ),
                              child: Container(
                                height: getVerticalSize(
                                  16.67,
                                ),
                                width: getHorizontalSize(
                                  13.33,
                                ),
                                child: Image.asset(
                                  "assets/images/location.png",
                                  fit: BoxFit.fill,color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  13.34,
                                ),
                                right: getHorizontalSize(
                                  135.00,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Club Name/ Sports Center",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        13,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        2.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Text(
                                      "3.5 km away",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            18.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  33.00,
                                ),
                              ),
                              child: Container(
                                height: getSize(
                                  15.00,
                                ),
                                width: getSize(
                                  15.00,
                                ),
                                child: Image.asset(
                                  "assets/images/calender.png",
                                  fit: BoxFit.fill,color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  12.00,
                                ),
                                right: getHorizontalSize(
                                  148.00,
                                ),
                              ),
                              child: Text(
                                "21.08.2022  Monday , 19.00",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            30.00,
                          ),
                          top: getVerticalSize(
                            30.00,
                          ),
                          right: getHorizontalSize(
                            30.00,
                          ),
                        ),
                        child: Text(
                          "Description",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.green6320,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: getHorizontalSize(
                            300.00,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              30.00,
                            ),
                            top: getVerticalSize(
                              7.00,
                            ),
                            right: getHorizontalSize(
                              30.00,
                            ),
                          ),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus in dolor volutpat facilisi fringilla amet aliquam  rhoncus elit. Eget bibendum proin habitant pellentesque  lectus ut vitae. Sed mollis euismod malesuada.",
                            maxLines: null,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                11,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0),
                            child: Text("${count} Players Added",style: TextStyle(color: Colors.black),),
                          ),

                        ],
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              30.00,
                            ),
                            top: getVerticalSize(
                              40.00,
                            ),
                            right: getHorizontalSize(
                              30.00,
                            ),
                            bottom: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: GestureDetector(onTap: (){
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context)=>AddMatchPlayers(Amount: widget.pendingamount,PaymentDone: paymentDone,Nopaycount:widget.nopaycount)));

                          },
                            child:
                            Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                45.00,
                              ),
                              width: getHorizontalSize(
                                300.00,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 0.5),
                                color: Colors.green[900],
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
                                  ),

                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                       TextButton(onPressed: (){


                            }, child:  Text("Won"
                                "") ),

                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              30.00,
                            ),

                            right: getHorizontalSize(
                              30.00,
                            ),
                            bottom: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: GestureDetector(onTap: (){
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context)=>AddMatchPlayers(Amount: widget.pendingamount,PaymentDone: paymentDone,Nopaycount:widget.nopaycount)));

                          },
                            child:
                            Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                45.00,
                              ),
                              width: getHorizontalSize(
                                300.00,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 0.5),
                                color: Colors.red[900],
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
                                  ),

                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  TextButton(onPressed: (){


                                  }, child:  Text("Lost"
                                      "") ),

                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ),

              ),


            ],
          ),
        ),);
  }


  // void _showDialog() {
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: Colors.blue),
  //           borderRadius: BorderRadius.all(Radius.circular(15.0)
  //           ),
  //         ),
  //         title: Center(child: Text("Payment details",style: TextStyle(fontSize: 24),)) ,
  //
  //         actions:[
  //           SizedBox(
  //             width: 80,
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                   primary: ColorConstant.green6320
  //               ),
  //               child:  Text("Pay",style: TextStyle(color: Colors.white,fontSize: 17),),
  //               onPressed: () async {
  //                 await  pay.getpaymentList(courtid, selectedIndex,
  //                   widget.date, TimeId, c.toInt(),);
  //                 openCheckout();
  //               },
  //
  //
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}