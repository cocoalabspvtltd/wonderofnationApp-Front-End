import 'package:flutter/material.dart';
import 'package:oo/dashboardItems/mymatches.dart';
import 'package:oo/homePage/sportAcademy.dart';


import '../addClubs/addclubs.dart';
import '../addClubs/myclubs.dart';
import '../addfriends/addfried.dart';
import '../chat/chatscreen.dart';
import '../constants/colors.dart';
import '../constants/mathutils.dart';
import '../myresults/gamedetail.dart';
import '../screens/login.dart';
import 'court.dart';
import 'homeitem.dart';
import 'navigator.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int radioGroup = 1;

  int radioGroup1 = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.indigo,
          ),
          title: Row(
            children: [
              SizedBox(
                width: 180,
              ),
              Container(child: Image.asset("assets/images/search.png")),
              SizedBox(
                width: 30,
              ),
              Container(child: Image.asset("assets/images/notification.png")),
              SizedBox(
                width: 30,
              ),
              GestureDetector(onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChatScreen()),
                );
              },
                  child: Container(child: Image.asset("assets/images/chat.png"))),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(height: 100,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                            child: GestureDetector(onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  DashBoard()),
                              );
                            },
                                child: Text("X",
                                    style: TextStyle(color: Colors.white,fontSize: 22)))),
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
                    GestureDetector(onTap: (){
                      print("hg");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  mymatches()),
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
                    GestureDetector(onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Myclubs()));

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
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Gamedetail()));
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
                      ),),

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
                        child: Icon(Icons.settings,color:Colors.black,size:22)
                    ),
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
                Divider(color:Colors.grey),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                          "assets/images/privacy.png",color:Colors.black
                      ),
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
                        "assets/images/help.png",color:Colors.black,
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
                // ListTile(
                //   title: Row(children: [
                //     Padding(
                //       padding: const EdgeInsets.all(5.0),
                //       child: Icon(
                //           Icons.,color:Colors.black
                //       ),
                //     ),
                //     SizedBox(
                //       width: 15,
                //     ),
                //     Text(
                //       "Privacy & Security",
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey[900]),
                //     ),
                //   ]),
                //   onTap: () {
                //     // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //     //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                //     // });
                //   },
                // ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                          Icons.logout,color:Colors.black
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LoginScreen()),
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
                  onTap: () {

                  },
                ),
              ],
            ),

          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: getVerticalSize(
                      26.00,
                    ),
                    bottom: getVerticalSize(
                      20.00,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: getHorizontalSize(
                            116.00,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            right: getHorizontalSize(
                              20.00,
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello',
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      24,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ',',
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      20,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Andria',
                                  style: TextStyle(
                                    color: ColorConstant.orange900,
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              8.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    32.00,
                                  ),
                                  top: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                                child: Text(
                                  "Most Popular",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                  bottom: getVerticalSize(
                                    3.00,
                                  ),
                                ),
                                child: Text(
                                  "See all",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.orange900,
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
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            top: getVerticalSize(
                              23.00,
                            ),
                            right: getHorizontalSize(
                              20.00,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black9000f,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  1,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getVerticalSize(
                                  206.00,
                                ),
                                width: getHorizontalSize(
                                  320.00,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(onTap: () { Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  CourtScreen()),
                                      );},child: Container(
                                          height: getVerticalSize(
                                            190.00,
                                          ),
                                          width: getHorizontalSize(
                                            320.00,
                                          ),
                                          margin: EdgeInsets.only(
                                            bottom: getVerticalSize(
                                              10.00,
                                            ),
                                          ),
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: EdgeInsets.all(0),
                                            color: ColorConstant.black900,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  getHorizontalSize(
                                                    15.00,
                                                  ),
                                                ),
                                                topRight: Radius.circular(
                                                  getHorizontalSize(
                                                    15.00,
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
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Image.asset(
                                                    "assets/images/seasonalchampionship.png",
                                                    height: getVerticalSize(
                                                      190.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      320.00,
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        20.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        35.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        145.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        20.00,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width:
                                                          getHorizontalSize(
                                                            166.00,
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Seasonal\nChampionship",
                                                            maxLines: null,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: TextStyle(
                                                              color: ColorConstant
                                                                  .whiteA700,
                                                              fontSize:
                                                              getFontSize(
                                                                22,
                                                              ),
                                                              fontFamily: 'Inter',
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            top: getVerticalSize(
                                                              20.00,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .only(
                                                                  bottom:
                                                                  getVerticalSize(
                                                                    13.00,
                                                                  ),
                                                                ),
                                                                child: Container(
                                                                    height:
                                                                    getSize(
                                                                      20.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      20.00,
                                                                    ),
                                                                    child: Image
                                                                        .asset(
                                                                        "assets/images/location.png")),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    "Club Name/ Sports Center",
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style:
                                                                    TextStyle(
                                                                      color: ColorConstant
                                                                          .whiteA700,
                                                                      fontSize:
                                                                      getFontSize(
                                                                        13,
                                                                      ),
                                                                      fontFamily:
                                                                      'Inter',
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                      top:
                                                                      getVerticalSize(
                                                                        2.00,
                                                                      ),
                                                                      right:
                                                                      getHorizontalSize(
                                                                        10.00,
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      "3.5 km away",
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                      style:
                                                                      TextStyle(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        fontSize:
                                                                        getFontSize(
                                                                          12,
                                                                        ),
                                                                        fontFamily:
                                                                        'Inter',
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                        ),
                                        ),
                                        Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                        margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                        11.00,
                                        ),
                                        top: getVerticalSize(
                                        10.00,
                                        ),
                                        right: getHorizontalSize(
                                        11.00,
                                        ),
                                        ),
                                        decoration: BoxDecoration(
                                        color: ColorConstant.orange900,
                                        borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                        10.00,
                                        ),
                                        ),
                                        ),
                                        child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                        Padding(
                                        padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                        17.00,
                                        ),
                                        top: getVerticalSize(
                                        17.00,
                                        ),
                                        bottom: getVerticalSize(
                                        17.00,
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
                                        fit: BoxFit.fill,
                                        ),
                                        ),
                                        ),
                                        Padding(
                                        padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                        8.00,
                                        ),
                                        top: getVerticalSize(
                                        9.00,
                                        ),
                                        right: getHorizontalSize(
                                        16.00,
                                        ),
                                        bottom: getVerticalSize(
                                        9.00,
                                        ),
                                        ),
                                        child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                        Text(
                                        "Monday",
                                        overflow:
                                        TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                        color: ColorConstant
                                            .whiteA700,
                                        fontSize: getFontSize(
                                        12,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight:
                                        FontWeight.w400,
                                        ),
                                        ),
                                        Padding(
                                        padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                        1.00,
                                        ),
                                        right: getHorizontalSize(
                                        10.00,
                                        ),
                                        ),
                                        child: Text(
                                        "19.00",
                                        overflow:
                                        TextOverflow.ellipsis,
                                        textAlign:
                                        TextAlign.center,
                                        style: TextStyle(
                                        color: ColorConstant
                                            .whiteA700,
                                        fontSize: getFontSize(
                                        12,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight:
                                        FontWeight.w400,
                                        ),
                                        ),
                                        ),
                                        ],
                                        )


                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    6.00,
                                  ),
                                  bottom: getVerticalSize(
                                    17.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          15.00,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: getVerticalSize(
                                              25.00,
                                            ),
                                            width: getHorizontalSize(
                                              56.00,
                                            ),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      right: getHorizontalSize(
                                                        10.00,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        getSize(
                                                          12.50,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/user1.png",
                                                        height: getSize(
                                                          25.00,
                                                        ),
                                                        width: getSize(
                                                          25.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        15.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        16.00,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        getSize(
                                                          12.50,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/user2.png",
                                                        height: getSize(
                                                          25.00,
                                                        ),
                                                        width: getSize(
                                                          25.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.centerRight,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        10.00,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        getSize(
                                                          12.50,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/user3.png",
                                                        height: getSize(
                                                          25.00,
                                                        ),
                                                        width: getSize(
                                                          25.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                5.00,
                                              ),
                                              top: getVerticalSize(
                                                5.00,
                                              ),
                                              bottom: getVerticalSize(
                                                5.00,
                                              ),
                                            ),
                                            child: Text(
                                              "and 2 more",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
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
                                        top: getVerticalSize(
                                          5.00,
                                        ),
                                        right: getHorizontalSize(
                                          16.00,
                                        ),
                                        bottom: getVerticalSize(
                                          5.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Entry Fee: ₹500",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.indigo900,
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
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            173.00,
                          ),
                          width: getHorizontalSize(
                            320.00,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            top: getVerticalSize(
                              27.00,
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
                                      10.00,
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/images/academy.png",
                                    height: getVerticalSize(
                                      173.00,
                                    ),
                                    width: getHorizontalSize(
                                      320.00,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      20.00,
                                    ),
                                    top: getVerticalSize(
                                      9.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                    bottom: getVerticalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            16.00,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: getHorizontalSize(
                                                  206.00,
                                                ),
                                                margin: EdgeInsets.only(
                                                  right: getHorizontalSize(
                                                    2.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Wonder of Nation \nSports Academy ",
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                    ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      24,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  11.00,
                                                ),
                                              ),
                                              child: Text(
                                                "International Sports Academy In India",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color:
                                                  ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    12,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  1.00,
                                                ),
                                                top: getVerticalSize(
                                                  13.00,
                                                ),
                                                right: getHorizontalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: GestureDetector(onTap:(){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>  WonScreen()),
                                                );
                                              },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: getVerticalSize(
                                                    32.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    131.00,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                    ColorConstant.orange900,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      getHorizontalSize(
                                                        5.00,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Book your seat now",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                      ColorConstant.whiteA700,
                                                      fontSize: getFontSize(
                                                        12,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            48.00,
                                          ),
                                          bottom: getVerticalSize(
                                            113.00,
                                          ),
                                        ),
                                        child: Image.asset(
                                          "assets/images/icon.png",
                                          height: getVerticalSize(
                                            32.00,
                                          ),
                                          width: getHorizontalSize(
                                            15.00,
                                          ),
                                          fit: BoxFit.fill,
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

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            top: getVerticalSize(
                              27.00,
                            ),
                            right: getHorizontalSize(
                              20.00,
                            ),
                          ),
                          child: Text(
                            "Suggested for you",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              22.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      10.00,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.indigo900,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConstant.black9000f,
                                      spreadRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      blurRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          25.00,
                                        ),
                                        top: getVerticalSize(
                                          39.00,
                                        ),
                                        right: getHorizontalSize(
                                          25.00,
                                        ),
                                      ),
                                      child: GestureDetector(onTap:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  AddFriends()),
                                        );
                                      },
                                        child: Container(
                                          height: getSize(
                                            50.00,
                                          ),
                                          width: getSize(
                                            50.00,
                                          ),
                                          child: Image.asset(
                                              "assets/images/add.png"),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            25.00,
                                          ),
                                          top: getVerticalSize(
                                            6.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.00,
                                          ),
                                          bottom: getVerticalSize(
                                            38.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Add friends",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black901,
                                            fontSize: getFontSize(
                                              12,
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
                              Container(
                                height: getVerticalSize(
                                  152.00,
                                ),
                                width: getHorizontalSize(
                                  241.00,
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      9.00,
                                    ),
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return HomeItemWidget();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              27.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                child: Text(
                                  "Near You",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    2.00,
                                  ),
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                child: Text(
                                  "See all",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
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
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            top: getVerticalSize(
                              22.00,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray200,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      15.00,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConstant.black90029,
                                      spreadRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      blurRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getHorizontalSize(
                                        224.00,
                                      ),
                                      height: 150,

                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            getHorizontalSize(
                                              15.00,
                                            ),
                                          ),
                                          topRight: Radius.circular(
                                            getHorizontalSize(
                                              15.00,
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
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorConstant.black9000f,
                                            spreadRadius: getHorizontalSize(
                                              2.00,
                                            ),
                                            blurRadius: getHorizontalSize(
                                              2.00,
                                            ),
                                            offset: Offset(
                                              4,
                                              0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child:













                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: getVerticalSize(
                                                190.00,
                                              ),
                                              width: getHorizontalSize(
                                                320.00,
                                              ),
                                              margin: EdgeInsets.only(
                                                bottom: getVerticalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: EdgeInsets.all(0),
                                                color: ColorConstant.black900,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      getHorizontalSize(
                                                        15.00,
                                                      ),
                                                    ),
                                                    topRight: Radius.circular(
                                                      getHorizontalSize(
                                                        15.00,
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
                                                child: Stack(
                                                  alignment: Alignment.centerLeft,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Image.asset(
                                                        "assets/images/seasonalchampionship.png",
                                                        height: getVerticalSize(
                                                          190.00,
                                                        ),
                                                        width: getHorizontalSize(
                                                          320.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                          left: getHorizontalSize(
                                                            20.00,
                                                          ),
                                                          top: getVerticalSize(
                                                            35.00,
                                                          ),
                                                          right: getHorizontalSize(
                                                            50.00,
                                                          ),
                                                          bottom: getVerticalSize(
                                                            20.00,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width:
                                                              getHorizontalSize(
                                                                140.00,
                                                              ),
                                                              margin: EdgeInsets.only(
                                                                right:
                                                                getHorizontalSize(
                                                                  10.00,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                "Friendly Match",                                                                 maxLines: null,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: TextStyle(
                                                                  color: ColorConstant
                                                                      .whiteA700,
                                                                  fontSize:
                                                                  getFontSize(
                                                                    22,
                                                                  ),
                                                                  fontFamily: 'Inter',
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                top: getVerticalSize(
                                                                  20.00,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                      bottom:
                                                                      getVerticalSize(
                                                                        13.00,
                                                                      ),
                                                                    ),
                                                                    child: Container(
                                                                        height:
                                                                        getSize(
                                                                          20.00,
                                                                        ),
                                                                        width:
                                                                        getSize(
                                                                          20.00,
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                            "assets/images/location.png")),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        "Club Name/ Sports Center",
                                                                        overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                        style:
                                                                        TextStyle(
                                                                          color: ColorConstant
                                                                              .whiteA700,
                                                                          fontSize:
                                                                          getFontSize(
                                                                            13,
                                                                          ),
                                                                          fontFamily:
                                                                          'Inter',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                          top:
                                                                          getVerticalSize(
                                                                            2.00,
                                                                          ),
                                                                          right:
                                                                          getHorizontalSize(
                                                                            10.00,
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                          "3.5 km away",
                                                                          overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                          style:
                                                                          TextStyle(
                                                                            color: ColorConstant
                                                                                .whiteA700,
                                                                            fontSize:
                                                                            getFontSize(
                                                                              12,
                                                                            ),
                                                                            fontFamily:
                                                                            'Inter',
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          6.00,
                                        ),
                                        bottom: getVerticalSize(
                                          17.00,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                15.00,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: getVerticalSize(
                                                    25.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    56.00,
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            right:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user1.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                        Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left:
                                                            getHorizontalSize(
                                                              15.00,
                                                            ),
                                                            right:
                                                            getHorizontalSize(
                                                              16.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user2.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user3.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      5.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      5.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      5.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "and 2 more",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .black900,
                                                      fontSize: getFontSize(
                                                        12,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                      FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                5.00,
                                              ),
                                              left: getHorizontalSize(
                                                25.00,
                                              ),
                                              bottom: getVerticalSize(
                                                5.00,
                                              ),
                                            ),
                                            child: Text(
                                              "Fee: ₹500",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.indigo900,
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
                            SizedBox(width:20),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray200,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      15.00,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConstant.black90029,
                                      spreadRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      blurRadius: getHorizontalSize(
                                        2.00,
                                      ),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getHorizontalSize(
                                        224.00,
                                      ),
                                      height: 150,

                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            getHorizontalSize(
                                              15.00,
                                            ),
                                          ),
                                          topRight: Radius.circular(
                                            getHorizontalSize(
                                              15.00,
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
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorConstant.black9000f,
                                            spreadRadius: getHorizontalSize(
                                              2.00,
                                            ),
                                            blurRadius: getHorizontalSize(
                                              2.00,
                                            ),
                                            offset: Offset(
                                              4,
                                              0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child:













                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: getVerticalSize(
                                                190.00,
                                              ),
                                              width: getHorizontalSize(
                                                320.00,
                                              ),
                                              margin: EdgeInsets.only(
                                                bottom: getVerticalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: EdgeInsets.all(0),
                                                color: ColorConstant.black900,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      getHorizontalSize(
                                                        15.00,
                                                      ),
                                                    ),
                                                    topRight: Radius.circular(
                                                      getHorizontalSize(
                                                        15.00,
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
                                                child: Stack(
                                                  alignment: Alignment.centerLeft,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Image.asset(
                                                        "assets/images/Rectangle 20.png",
                                                        height: getVerticalSize(
                                                          190.00,
                                                        ),
                                                        width: getHorizontalSize(
                                                          320.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                          left: getHorizontalSize(
                                                            20.00,
                                                          ),
                                                          top: getVerticalSize(
                                                            35.00,
                                                          ),
                                                          right: getHorizontalSize(
                                                            50.00,
                                                          ),
                                                          bottom: getVerticalSize(
                                                            20.00,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width:
                                                              getHorizontalSize(
                                                                140.00,
                                                              ),
                                                              margin: EdgeInsets.only(
                                                                right:
                                                                getHorizontalSize(
                                                                  10.00,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                "Friendly Match",                                                                 maxLines: null,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: TextStyle(
                                                                  color: ColorConstant
                                                                      .whiteA700,
                                                                  fontSize:
                                                                  getFontSize(
                                                                    22,
                                                                  ),
                                                                  fontFamily: 'Inter',
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                top: getVerticalSize(
                                                                  20.00,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                      bottom:
                                                                      getVerticalSize(
                                                                        13.00,
                                                                      ),
                                                                    ),
                                                                    child: Container(
                                                                        height:
                                                                        getSize(
                                                                          20.00,
                                                                        ),
                                                                        width:
                                                                        getSize(
                                                                          20.00,
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                            "assets/images/location.png")),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        "Club Name/ Sports Center",
                                                                        overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                        style:
                                                                        TextStyle(
                                                                          color: ColorConstant
                                                                              .whiteA700,
                                                                          fontSize:
                                                                          getFontSize(
                                                                            13,
                                                                          ),
                                                                          fontFamily:
                                                                          'Inter',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                          top:
                                                                          getVerticalSize(
                                                                            2.00,
                                                                          ),
                                                                          right:
                                                                          getHorizontalSize(
                                                                            10.00,
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                          "3.5 km away",
                                                                          overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                          style:
                                                                          TextStyle(
                                                                            color: ColorConstant
                                                                                .whiteA700,
                                                                            fontSize:
                                                                            getFontSize(
                                                                              12,
                                                                            ),
                                                                            fontFamily:
                                                                            'Inter',
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          6.00,
                                        ),
                                        bottom: getVerticalSize(
                                          17.00,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                15.00,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: getVerticalSize(
                                                    25.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    56.00,
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            right:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user1.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                        Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left:
                                                            getHorizontalSize(
                                                              15.00,
                                                            ),
                                                            right:
                                                            getHorizontalSize(
                                                              16.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user2.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                              getSize(
                                                                12.50,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/user3.png",
                                                              height: getSize(
                                                                25.00,
                                                              ),
                                                              width: getSize(
                                                                25.00,
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      5.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      5.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      5.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "and 2 more",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .black900,
                                                      fontSize: getFontSize(
                                                        12,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                      FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                5.00,
                                              ),
                                              left: getHorizontalSize(
                                                25.00,
                                              ),
                                              bottom: getVerticalSize(
                                                5.00,
                                              ),
                                            ),
                                            child: Text(
                                              "Fee: ₹500",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.indigo900,
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

                            ],
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
  }
}
                              