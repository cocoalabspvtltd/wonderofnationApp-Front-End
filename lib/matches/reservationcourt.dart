import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/reservationcourtbloc.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/reservationcourt.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/apis/repositories/reservationcourtrepositories.dart';
import 'package:oo/matches/reservationcourt.dart';

import '../apis/bloc/clublistbloc.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../screens/shimmer.dart';
import 'addplayers.dart';
import 'clubdetails.dart';



class ReservationCourt extends StatefulWidget {
  const ReservationCourt({Key? key, required this.club_id, required this.date}) : super(key: key);
final int club_id;
final String date;
  @override
  State<ReservationCourt> createState() => _ReservationCourtState();
}

class _ReservationCourtState extends State<ReservationCourt> {
  late ReservationCourtBloc _bloc;

  List<dynamic> patientappointmentsearchdata = [];
  List<dynamic> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  void initState() {
    super.initState();
    _bloc =ReservationCourtBloc(widget.club_id,widget.date);

    setState(() {});
  } List court = ["Court 1", "Court 2", "Court 3"];
  int selectedIndex2 = 0;
  List times = ["10.00", "12.00", "14.00","19.00"];
  int selectedIndex1 = 0;
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());
  var date;
  var _valueToValidate3;
  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;

  @override
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "The nearest dates",
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
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Booking Method",
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
                  padding: const EdgeInsets.only(
                      left: 20
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _colorContainer1 = _colorContainer1 == ColorConstant.orange900 ?
                            ColorConstant.whiteA700 :ColorConstant.orange900;
                          });

                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            40.00,
                          ),
                          width: getHorizontalSize(
                            110.00,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            border: Border.all(color: ColorConstant.orange900),
                            color: _colorContainer1 ,
                          ),

                          child: Text(
                            "Public",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black901,
                              fontSize: getFontSize(
                                18,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ),
                      ),
                      SizedBox(width: 25,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _colorContainer2 = _colorContainer2 == ColorConstant.orange900 ?
                            ColorConstant.whiteA700 :ColorConstant.orange900;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            40.00,
                          ),
                          width: getHorizontalSize(
                            110.00,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            border: Border.all(color: ColorConstant.orange900),
                            color: _colorContainer2,
                          ),
                          child: Text(
                            "Private",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black901,
                              fontSize: getFontSize(
                                18,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
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
                                  selectedTileColor: ColorConstant.orange900,
                                  selectedColor:ColorConstant.gray200 ,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(title[index]["name"],style: TextStyle(
                                        color: selectedIndex2 == index ? Colors.white : Colors.black,fontSize: 15),),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex2 = index;
                                    });
                                  },
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

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Select your time",
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
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 45,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 5,);},
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: slots.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 45,
                            width: 85,
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: selectedIndex1 == index ? Colors.white : Colors.black,width: 0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  selected: selectedIndex1 == index? true: false,
                                  selectedTileColor: ColorConstant.orange900,
                                  selectedColor:ColorConstant.whiteA700 ,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(slots[index]["time"],style: TextStyle(
                                      color: selectedIndex1 == index ? Colors.white : Colors.black,),),
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
                SizedBox(
                  height: 10,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        30.00,
                      ),
                      top: getVerticalSize(
                        15.00,
                      ),
                      right: getHorizontalSize(
                        30.00,
                      ),
                      bottom: getVerticalSize(
                        20.00,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Addplayers()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          45.00,
                        ),
                        width: getHorizontalSize(
                          250.00,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color:Colors.grey,
                          ),
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            5.00,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            Icon(
                              Icons.add_circle_outline,
                              color: ColorConstant.bluegray800,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add Players",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  18,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                  child: Container(
                    height:100,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "₹2500 ",
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
                            SizedBox(height: 20,),
                          ],
                        ),
                        SizedBox(width: 120,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 45),
                            primary:  ColorConstant.orange900,
                            elevation: 2,
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(10.0)
                            ),),
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymentpage()));
                          },
                          child: Text(
                            "Book Now",
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
                  ),
                ),
              ],
            ),
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
                Navigator.push(context,
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

        body: StreamBuilder<Response<List<dynamic>>>(
            stream: _bloc.ReservationCourtseDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    List<dynamic> patientappointmentList =
                        snapshot.data!.data;
                    patientappointmentsearchdata = patientappointmentList;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _jobsListView(patientappointmentsearchdata)
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container();
                }
              }
              return Container();
            })
    );
  }
}