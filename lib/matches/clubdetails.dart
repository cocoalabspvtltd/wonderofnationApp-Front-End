import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/clubdetailsmodel.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/matches/reservationcourt.dart';
import 'package:http/http.dart' as http;

import '../addClubs/myclubs.dart';
import '../apis/bloc/clubdetialsbloc.dart';
import '../apis/bloc/clublistbloc.dart';
import '../apis/repositories/clubdetailsrepositories.dart';
import '../apis/repositories/clublistrepositories.dart';
import '../apis/repositories/registerRepositories.dart';
import '../constants/baseurls.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../dashboardItems/mymatches.dart';
import '../dropdowns/gamesdropdown.dart';
import '../dropdowns/registergamedropdown.dart';
import '../dropdowns/testdropdown.dart';
import '../homePage/navigator.dart';
import '../myresults/gamedetail.dart';
import '../screens/login.dart';
import '../screens/shimmer.dart';
import 'matchcourt.dart';
import 'matchhome.dart';

class ClubDetails extends StatefulWidget {
  const ClubDetails({Key? key, required this.club_id, required this.date}) : super(key: key);
final int club_id;
final String date;
  @override
  State<ClubDetails> createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  late ClubDetailslistBloc _bloc;
  ClubDetailsRepository sortListClub = ClubDetailsRepository();
  List<ClubDetailsModel> ClubDetailssearchdata = [];
  List<ClubDetailsModel> ClubDetailsModelserachlist = [];
  TextEditingController ClubDetailsModelController = TextEditingController();
 // ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  List court = ["Court 1", "Court 2", "Court 3"];
  int selectedIndex2 = 0;
  List gallery=[
    "assets/images/court.png",
    "assets/images/past.png",
    "assets/images/spash5.jpg",
  ];
List Imagelist = [];
  void initState() {
    super.initState();
   // getallcourtImage();
    print("date-->${widget.date}");
    _bloc = ClubDetailslistBloc(widget.club_id);
//print("object=>>>>>${Imagelist}");
    setState(() {});
  }
  List imglist = [];

  // Future getallcourtImage() async {
  //   print("imgurl->>>.${baseurl}clubs/our/courts?club_id=${widget.club_id}");
  //
  //   http.Response response = await http.get(Uri.parse('${baseurl}clubs/our/courts?club_id=${widget.club_id}'), headers: <String, String>{
  //     'Accept': "appilication/json",
  //     'Authorization': 'Bearer $TOKEN',
  //   },);
  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     setState(() {
  //       imglist = jsonData;
  //       print("Imagelist->${imglist}");
  //     });
  //   }
  // }

  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data.length}");
          return _tile( data[index].name,
              data[index].description ,data[index].state,data[index].city);
        });
  }
  SizedBox _tile(
     String name, String description, String state,String city) =>
      SizedBox(height: size.height,
          child:  SafeArea(
            child: Container(
              width: size.width,
              child:
              Container(

                width: size.width,
                decoration: BoxDecoration(
                  color: ColorConstant.gray200,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: getVerticalSize(
                          340.00,
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
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: CachedNetworkImage(
                            //     imageUrl: img?? "",
                            //     placeholder: (context, url) => CircularProgressIndicator(),
                            //     errorWidget: (context, url, error) => Image.asset("assets/images/football.jpg",fit: BoxFit.fill,),
                            //     height: getVerticalSize(
                            //       400.00,
                            //     ),
                            //     width: getHorizontalSize(
                            //       360.00,
                            //     ),
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(

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


                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: getHorizontalSize(
                                      140.00,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        30.00,
                                      ),
                                      top: 10
                                    ),
                                    child: Text(
                                      name,
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          27,
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
                                  30.00,
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
                                        1.67,
                                      ),
                                      bottom: getVerticalSize(
                                        11.66,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        25.67,
                                      ),
                                      width: getHorizontalSize(
                                        22.33,
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
                                        14.34,
                                      ),
                                      right: getHorizontalSize(
                                        30.00,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state}/ ${city}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(23,),
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
                                                15,
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
                                left: getHorizontalSize(
                                  30.00,
                                ),
                                top: getVerticalSize(
                                  22.00,
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
                                    17,
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
                                  description,
                                  maxLines: null,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 15,),
                            Padding(
                              padding: EdgeInsets.only(left: 27),
                              child: Text(
                                "Our Courts",
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
                            SizedBox(height: 15,),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 10,right: 10),
                            //   child: Container(
                            //     width: size.width,
                            //     height: 160,
                            //     child: Swiper(
                            //       itemBuilder: (BuildContext context, int index) {
                            //         print("ImagelistImagelistImagelist-->>>>>>${imglist.length}");
                            //         return
                            //           CachedNetworkImage(
                            //           fit: BoxFit.fill,
                            //           imageUrl: imglist[index]["img"] == null
                            //               ? "assets/images/football.jpg"
                            //               : imglist[index]["img"],
                            //           placeholder: (context, url) => CircularProgressIndicator(),
                            //           errorWidget: (context, url, error) =>
                            //           imglist[index]["img"] == null
                            //               ? Image.asset(
                            //             "assets/images/football.jpg",
                            //             fit: BoxFit.fill,
                            //           )
                            //               : imglist[index]["img"],
                            //         );
                            //
                            //          },
                            //       autoplay: true,
                            //       itemCount: imglist.length,
                            //
                            //       pagination: SwiperPagination(
                            //           builder: DotSwiperPaginationBuilder(
                            //             color: Colors.white30,
                            //             activeColor: Colors.white,
                            //             size: 7,
                            //           )
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservationCourt(club_id: widget.club_id, date: widget.date,)));
                                },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: getVerticalSize(
                                      45.00,
                                    ),
                                    width: getHorizontalSize(
                                      300.00,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.green6320,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Reserve Court",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),);

  TextEditingController searchcontroller = new TextEditingController();
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60.9,
          backgroundColor: ColorConstant.whiteA700,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: ColorConstant.whiteA700,
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard(
                                          UserName1: '',
                                        )),
                                  );
                                },
                                child: Text("X",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)))),
                      )),
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/mymatches.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("hg");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mymatches()),
                        );
                      },
                      child: Text(
                        "My Matches",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 4,
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/myclubs.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Myclubs()));
                      },
                      child: Text(
                        "My Clubs",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.MY_PROFILE);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/myresults.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Gamedetail()));
                      },
                      child: Text(
                        "My Results",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/payment.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        // WidgetsBinding.instance!.addPostFrameCallback((_) {
                        //   Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                        // });
                      },
                      child: Text(
                        "Payment Methods",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {},
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.settings,
                            color: Colors.black, size: 22)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                Divider(color: Colors.grey),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/images/privacy.png",
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Privacy & Security",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/help.png",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.logout, color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.blue,
          onRefresh: () {
            return _bloc.getClubDetailsList(widget.club_id);
          },
          child: StreamBuilder<Response<List<ClubDetailsModel>>>(
              stream: _bloc.ClubDetailsDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("sdfghjk");
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Builder(builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      }); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                      List<ClubDetailsModel> clubdetailsList =
                          snapshot.data!.data;
                      ClubDetailsModelserachlist = clubdetailsList;
                      return SingleChildScrollView(child:_jobsListView(ClubDetailsModelserachlist));

                      break;
                    case Status.ERROR:
                      return Container(  color: Colors.red,);
                  }
                }
                return Container(  color: Colors.white,);
              }),
        ));
  }
}
