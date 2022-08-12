import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/bloc/Coiurt_slot_bloc.dart';
import 'package:oo/apis/bloc/reservationcourtbloc.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/modelclass/reservationcourt.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/apis/repositories/reservationcourtrepositories.dart';
import 'package:oo/matches/publiccourt.dart';
import 'package:oo/matches/reservationcourt.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../apis/bloc/clublistbloc.dart';
import '../apis/repositories/registerRepositories.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../screens/shimmer.dart';
import 'addplayers.dart';
import 'clubdetails.dart';



class CourtSlots extends StatefulWidget {
  const CourtSlots({Key? key, required this.club_id, required this.date, required this.method}) : super(key: key);
  final int club_id;
  final String date;
  final String method;
  @override
  State<CourtSlots> createState() => _CourtSlotsState();
}

class _CourtSlotsState extends State<CourtSlots> {
  late CourtSlotBloc _bloc;
  List book_model= ["Private", "Public"];
  int selectedIndex = -1;
  String buttontext1="Pay Now";
  List<dynamic> patientappointmentsearchdata = [];
  List<dynamic> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  List court = ["Court 1", "Court 2", "Court 3"];
  int selectedIndex2 = -1;
  List times = ["10.00", "12.00", "14.00","19.00"];
  int selectedIndex1 = -1;
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());

  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;

  void initState() {
    super.initState();
    _bloc = CourtSlotBloc(widget.date, widget.method, widget.club_id);


    setState(() {});
  }
  @override
  Widget timeSlotView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index]["timeslots"]}");
          return _tile(data[index]["timeslots"],data[index]["image"] );
        });
  }

  SizedBox _tile(
      List slots,String image ) =>
      SizedBox(
        width: size.width,
        child:    Padding(
          padding: const EdgeInsets.only(left: 18,top: 40,right:18),
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
                            side: BorderSide(color: selectedIndex2 == index ? Colors.white : Colors.black,width: 0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          selected: selectedIndex2 == index? true: false,
                          selectedTileColor: ColorConstant.green6320,
                          selectedColor:ColorConstant.gray200 ,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(slots[index]["time"],style: TextStyle(
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

      );



  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(


        body: StreamBuilder<Response<List<dynamic>>>(
            stream: _bloc.Court_clubDataStream,
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
                          timeSlotView(patientappointmentsearchdata),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 60 ),
                    //         child: Container(height:35,
                    // width:150,
                    //   color: ColorConstant.green6320,
                    //   child: Center(child: GestureDetector(
                    //       onTap: (){
                    //
                    //         Navigator.pop(context);
                    //       },
                    //       child: Text("Book",style: TextStyle(color: ColorConstant.whiteA700),))),
                    // ),
                    //       )
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