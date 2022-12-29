import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/reservation_court_bloc.dart';
import 'package:oo/apis/repositories/joined_clubs.dart';
import 'package:oo/screens/dashboardItems/history_screen.dart';
import 'package:oo/screens/matches/add_players.dart';
import 'package:oo/screens/matches/whatsappshare.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../apis/bloc/Coiurt_slot_bloc.dart';
import '../../apis/repositories/payment.dart';
import '../../apis/repositories/paymentcucesss.dart';
import '../../apis/repositories/refferel_user.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';
import 'club_details.dart';

String? razorpay_signature = "";
String? PaymentId = "";
String? OrderRazorpayId = "";
bool? holdSlotvalue;
bool? addplayersvalue;
int   Playercount =0;
List check = [];
List<bool> isChecked = List.generate(forAddPlayers.length, (index) => false);
TextEditingController refferelpasscontroller = TextEditingController();

class ReservationCourt extends StatefulWidget {
  const ReservationCourt({
    Key? key,
    required this.club_id,
    required this.date,
    required this.ClubName,
    required this.state,
    required this.city,
  }) : super(key: key);
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
  List book_model = ["Private", "Public"];
  int selectedIndex = -1;
  int slot = 0;
  int price = 0;
  String y = "";
  String addplayerdisplayvalue= "";


  int courtid = 0;
  bool a = false;
  String mText1 = "See All";

  int TimeId = 0;
  TextEditingController refferelCOntroller = TextEditingController();
  List<dynamic> patientappointmentsearchdata = [];
  List<dynamic> patientappointmentserachlist = [];

  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();



  getTimeSlot(int courtId) async {
    setState(() {
      isLoading = true;
    });
    await _courtSlotBloc.getReservationCourtsDetailsList(
        widget.date, selectedIndex, courtId);
    setState(() {
      isLoading = false;
    });
  }
  int playerId=0;
  String playername = "";
  void _visibilitymethod1() {
    setState(() {
      if (a) {
        a = false;
        mText1 = "See All";
      } else {
        a = true;
        mText1 = "See hide";
      }
    });
  }


  int selectedIndex2 = -1;

  int selectedIndex1 = -1;
  String buttontext = "Book Now";

  TextEditingController dateinputcontroller =
      new TextEditingController(text: DateTime.now().toString());

  @override
  bool value = false;
  bool value1 = false;
  bool value2 = false;


  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index]["timeSlots"]}");
          return _tile(data[index]["courts"], data[index]["timeSlots"],
              data[index]["image"]);
        });
  }

  SizedBox _tile(List title, List slots, String image) => SizedBox(
        height: size.height,
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
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
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(widget.date),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Container(
                    child: Text(
                      widget.ClubName,
                      style: TextStyle(
                          fontSize: 18, color: ColorConstant.green6320),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Container(
                    child: Text(
                      "${widget.state}/ ${widget.city}",
                      style: TextStyle(
                          fontSize: 18, color: ColorConstant.green6320),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 45,
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
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
                                        side: BorderSide(
                                            color: ColorConstant.green6320,
                                            width: 0.6),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: ListTile(
                                      selected:
                                      selectedIndex == index ? true : false,
                                      selectedTileColor:
                                      ColorConstant.green6320,
                                      selectedColor: ColorConstant.whiteA700,
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20, left: 16),
                                        child: Text(
                                          book_model[index],
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        selectedIndex = index;
                                        setState(() {});
                                        if (selectedIndex == 1)
                                          await getTimeSlot(title[index]["id"]);
                                        setState(() {
                                          print("tfgh");
                                          price = title[index]["price"];
                                          courtid = title[index]['id'];
                                          slot = title[index]["slots"];
                                          double x = (price / slot);
                                          y = x.toStringAsFixed(0);
                                          print("y2 ->>>>>>>.${y}");

                                          //
                                        });
                                        //selectedIndex2 == index;
                                      },
                                      // {
                                      //   setState(() {
                                      //     selectedIndex = index;
                                      //     selectedIndex = index;
                                      //
                                      //     print(
                                      //         "selectedInex--->${selectedIndex = index}");
                                      //   });
                                      // },
                                    )),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Tooltip(
                      // height: MediaQuery.of(context).size.height * 0.05 ,
                      message:
                      '                     Description '
                          '\n'
                          'Private : Book a court for yourself and friends\n'
                          'Public  : Book a court for a public match and play with other players',
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                      decoration: BoxDecoration(
                          color: ColorConstant.green6320.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(22)),
                      showDuration: Duration(seconds: 5),
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.032,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.question_mark_sharp,
                                size: 15,
                                color: ColorConstant.black901,
                              ),
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: ColorConstant.green6320,
                                ),
                                primary: ColorConstant.whiteA700,
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Text(
                            "Tap and hold to info",
                            style: TextStyle(
                                fontSize: 8.2, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
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
                                    side: BorderSide(
                                        color: selectedIndex2 == index
                                            ? Colors.white
                                            : Colors.black,
                                        width: 0.1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ListTile(
                                  selected:
                                      selectedIndex2 == index ? true : false,
                                  selectedTileColor: ColorConstant.green6320,
                                  selectedColor: ColorConstant.gray200,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: GestureDetector(
                                      onTap: () async {
                                        selectedIndex2 = index;
                                        setState(() {});
                                        await getTimeSlot(title[index]["id"]);
                                        setState(() {
                                          print("tfgh");

                                          price = title[index]["price"];
                                          courtid = title[index]['id'];
                                          slot = title[index]["slots"];

                                          double x = (price / slot);
                                          y = x.toStringAsFixed(0);
                                          print("y2 ->>>>>>>.${y}");
                                          //
                                        });
                                        //selectedIndex2 == index;
                                      },
                                      child: Text(
                                        title[index]["name"],
                                        style: TextStyle(
                                            color: selectedIndex2 == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 15),
                                      ),
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
                        top: 15),
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
                            child: CachedNetworkImage(
                              imageUrl: image,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset("assets/images/splash6.jpg",
                                fit: BoxFit.fill,
                              ),
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
                isLoading ?? false
                    ? Center(
                        child: Center(
                        child: Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              color: ColorConstant.green6320),
                        ),
                      ))
                    : Container(),
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
                            patientappointmentsearchdata =
                                patientappointmentList;
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
                  height: 20,
                ),
             if(selectedIndex == 0 && forAddPlayers.isNotEmpty) a == true?Padding(
               padding: EdgeInsets.only(left: 30,top: 20,bottom: 20),
               child: ListView.separated(
                 separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(
                   height: 7,
              ); },
                       shrinkWrap: true,
                 physics:NeverScrollableScrollPhysics(),
                       itemCount: forAddPlayers.length, itemBuilder: (context, index){
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Checkbox(
                           value: isChecked[index],
                           activeColor: ColorConstant.green6320,
                           onChanged: (checked) {
                             setState(() {
                               isChecked[index] = checked!;
                               //  _title = _getTitle();
                               Playercount=isChecked.where((check) => check == true).length;
                               print("count->>>>>>>>>>${Playercount}");
                               // print("title${_title}");
                               print("value-<<<<<<<<<${isChecked[index]}");
                             });
                           },
                         ),
                         CachedNetworkImage(imageUrl: forAddPlayers[index]['dp']!,
                           placeholder: (context, url) =>
                               CircularProgressIndicator(),
                         imageBuilder: (context, imageProvider)=> CircleAvatar(
                           radius: 18,
                           backgroundImage: imageProvider,),
                           errorWidget:(context, strin, dy)=> Icon(Icons.account_box_outlined),
                         ),
                         SizedBox(width: 10,),
                         Text(forAddPlayers[index]['name']!)
                       ],

                     );
                   }, ),
             ):Padding(
               padding: const EdgeInsets.only(left: 30,top: 20,bottom: 20),
               child: ListView.separated(
                 separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(
                   height: 7,
                 ); },
                shrinkWrap: true,
                itemCount: forAddPlayers.length >=5  ? 5: forAddPlayers.length, itemBuilder: (context, index){


                 // String _getTitle() =>
                 //     "Checkbox Demo : Checked = ${isChecked.where((check) => check == true).length}, "
                 //         "Unchecked = ${isChecked.where((check) => check == false).length}";
                 // String _title = "Checkbox Demo";
            return Row(
                children: [
                  Checkbox(
                    value: isChecked[index],
                    activeColor: ColorConstant.green6320,
                    onChanged: (checked) {
                      setState(() {
                        isChecked[index] = checked!;
                        Playercount=isChecked.where((check) => check == true).length;
                        print("count->>>>>>>>>>${Playercount}");
                        // print("title${_title}");
                        print("value-<<<<<<<<<${isChecked[index]}");
                      });
                    },
                  ),
                  CachedNetworkImage(imageUrl: forAddPlayers[index]['dp']!,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    imageBuilder: (context, imageProvider)=> CircleAvatar(
                      radius: 18,
                      backgroundImage: imageProvider,),
                    errorWidget:(context, strin, dy)=> Icon(Icons.account_box_outlined),
                  ),
                  SizedBox(width: 10,),
                  Text(forAddPlayers[index]['name']!)
                ],
            );
          }),
             ),
                SizedBox(height: 10,),
               if(selectedIndex==0 && forAddPlayers.length>=3) InkWell(
                  onTap: (){
                    _visibilitymethod1();
                  },
                  child: Center(
                    child: Text(
                      mText1,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  if(selectedIndex==0)
                  Center(
                    child:  GestureDetector(onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> AddPlayers()));
                    },
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          45.00,
                        ),
                        width: getHorizontalSize(
                          280.00,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 0.5),
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              5.00,
                            ),

                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline,size: 17,),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                            Text(
                              "Add Players",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black901,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),SizedBox(height: 150,)
              ],
            ),
          ),
        ),
      );
  String? slotColor;

  Widget timeSlotView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index]["timeslots"]}");
          return timeTile(
            data[index]["timeslots"],
            data[index]["image"],
          );
        });
  }

  SizedBox timeTile(
    List slots,
    String image,
  ) =>
      SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
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
                  print("slots->>${slots}");
                  //TimeId = slots[index]["id"];
                  slotColor = slots[index]["slot_status"];
                  return SizedBox(
                    // height: 45,
                    width: 120,
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        color: ColorConstant.gray200,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: selectedIndex1 == index
                                    ? Colors.white
                                    : Colors.black,
                                width: 0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          selected: selectedIndex1 == index ? true : false,
                          selectedTileColor: selectedIndex == 1
                              ? (slotColor == "green")
                                  ? Colors.green[900]
                                  : (slotColor == "blue")
                                      ? Colors.blue[900]
                                      : (slotColor == "red")
                                          ? Colors.red[900]
                                          : Colors.grey
                              : Colors.grey,
                          tileColor:
                          selectedIndex ==1? (slotColor == "green")
                              ? Colors.green[400]
                              : (slotColor == "blue")
                                  ? Colors.blue[400]
                                  : Colors.red[400]:Colors.grey[100],
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Text(
                                  slots[index]["time"],
                                  style: TextStyle(
                                      color: selectedIndex1 == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15),
                                ),
                                selectedIndex == 1
                                    ? Text(
                                        "${slots[index]["available_slots"].toString()} left",
                                        style: TextStyle(
                                            color: selectedIndex1 == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : (SizedBox(height: 0))
                              ],
                            ),
                          ),
                          onTap: () {
                            selectedIndex1 = index;
                            slotSelected = true;
                            TimeId = slots[index]["id"];
                            print("timeslot->${TimeId}");
                            if (slots[index]["slot_status"] == "blue") {
                              setState(() {
                                slotColor = 'blue';

                                slotColor = slots[index]["slot_status"];
                                showAlertDialog(context);
                              });
                            }
                            if (slots[index]["slot_status"] == "red") {
                              setState(() {
                                slotColor = 'red';
                                slotColor = slots[index]["slot_status"];
                                showAlertDialognoSlots(context);
                              });
                            }
                            slotColor = "green";
                            setState(() {});
                          },
                        )),
                  );
                }),
          ),
        ),
      );

  TextEditingController searchcontroller = new TextEditingController();
  bool slotSelected = false;

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
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClubDetails(
                              date: '',
                              club_id: 0,
                            )));
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
        bottomSheet: (!slotSelected)
            ? Container(
                height: 0,
              )
            : Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 6,
                child: Container(
                  height: 114,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     IconButton(onPressed: (){
                      //       Navigator.pop(context);
                      //     }, icon: Icon(Icons.close)),
                      //   ],
                      // ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              if (selectedIndex == 1)
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
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
                                    )),


    if (selectedIndex == 0&&addplayersvalue==true)
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "₹${price/Playercount.toInt()}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          28,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              if (selectedIndex == 0&&addplayersvalue==false)
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
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
                                  )),
                              if (selectedIndex == 0)
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
                              if (selectedIndex == 1)
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
                          SizedBox(
                            width: 160,
                          ),
                  slotColor=="red"? Container():ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              primary: ColorConstant.green6320,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () async {


                            await  pay.getpaymentList(courtid, selectedIndex,
                                  widget.date, TimeId, selectedIndex==0?price:y,);
                              openCheckout();
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
                      SizedBox(
                        height: 2,
                      ),
                      if (selectedIndex == 1)
                        (slotColor == 'blue')
                            ? Container()
                            : Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Checkbox(
                                    value: this.value,
                                    activeColor: ColorConstant.green6320,
                                    onChanged: (value) {
                                      setState(() {
                                        this.value = value!;
                                        holdSlotvalue = this.value;
                                        print("value-<<<<<<<<<${this.value}");
                                      });
                                    },
                                  ),
                                  SizedBox(width: 0), //SizedBox
                                  Text(
                                    'Do you want to hold this slot?',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                  ), //Text
                                  //SizedBox
                                  //Checkbox
                                ], //<Widget>[]
                              ),
                      if (selectedIndex == 0)
                        (slotColor == 'blue')
                            ? Container()
                            : Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Checkbox(
                              value: this.value1,
                              activeColor: ColorConstant.green6320,
                              onChanged: (value1) {
                                setState(() {
                                  this.value1 = value1!;
                                  addplayersvalue = this.value1;
                                  print("value1-<<<<<<<<<${this.value1}");
                                });
                              },
                            ),
                            SizedBox(width: 0), //SizedBox
                            Text(
                              'Are you sure to add players ?',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500),
                            ), //Text
                            //SizedBox
                            //Checkbox
                          ], //<Widget>[]
                        ),
                    ],
                  ),
                ),
              ),
        body: SingleChildScrollView(
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
                              child: CircularProgressIndicator(
                                  color: ColorConstant.green6320),
                            ),
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
                              _jobsListView(patientappointmentsearchdata)
                            ],
                          );

                          break;
                        case Status.ERROR:
                          return Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  color: ColorConstant.green6320),
                            ),
                          );
                      }
                    }
                    return Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            color: ColorConstant.green6320),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }

  String OrderId = "";
  late Razorpay _razorpay;
  Payemnt pay = Payemnt();
  PayemntSucess paysucess = PayemntSucess();
  bool pressed = false;
  String orderPlace = "";
  String PlaceOrder = "Place Order";
  GetRefferelCode Refferelcode = GetRefferelCode();

  void initState() {
    super.initState();

    _bloc = ReservationCourtBloc(widget.club_id, widget.date);
    _courtSlotBloc = CourtSlotBloc(
      widget.date,
      selectedIndex,
      0,
    );


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
      'order_id': Orderid,
      'amount':selectedIndex == 0?price:y,
      'name': "WON",
      'description': 'Payment',
      'retry': {'enabled': true, 'max_count': 3},
      'send_sms_hash': true,
      'prefill': {'contact': phone, 'email': email, 'name': name},
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
    PaymentId = response.paymentId;
    razorpay_signature = response.signature;
    OrderRazorpayId = response.orderId;
    paysucess.getpaymentsucessList(
        PaymentId!, Orderid, razorpay_signature, context);

   selectedIndex == 1? showAlertDialogrefferel(context):Container();
    // sucess == "Payment successful"
    //     ? showAlertDialog
    //     : SizedBox(
    //         height: 0,
    //       );
    // print("dfv");
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
      onPressed: () {
        Refferelcode.getRefferelCode(
            courtid, TimeId, refferelCOntroller.text, widget.date);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " This time slot is in hold for next 1 Hour.",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            " To book enter your refferel code",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: refferelCOntroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: 'Enter Refferel',
            ),
          ),
        ],
      ),

      // content: Text("${refferel}"),
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
  showAlertDialognoSlots(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {

        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Not Avilable",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),

        ],
      ),

      // content: Text("${refferel}"),
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

  showAlertDialogrefferel(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REFFEREL",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: refferelpasscontroller,
            decoration: InputDecoration(
              hintText: "${refferel}",
              suffixIcon: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: refferel));
                  Fluttertoast.showToast(
                      backgroundColor: Colors.blue,
                      msg: "Reffrel Copied ",
                      toastLength: Toast.LENGTH_SHORT);
                },
                icon: Icon(Icons.copy),
              ),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Share with friends",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          Center(
              child: WhatsappShare(
            refferelwhatsapp: refferel,
          )),
        ],
      ),

      // content: Text("${refferel}"),
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

  Future<void> getpaymentsucessList(
      String razorpay_payment_id, razorpay_order_id, razorpay_signature) async {
    var response = await http.post(
        Uri.parse(
            "https://d917-59-98-51-52.ngrok.io/api/payment/signature-verify"),
        body: {
          "razorpay_payment_id": PaymentId,
          "razorpay_order_id": Orderid,
          "razorpay_signature": razorpay_signature
        });
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
