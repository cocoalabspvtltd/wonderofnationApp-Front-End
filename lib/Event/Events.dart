

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../addClubs/myclubs.dart';
import '../chat/chatscreen.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../dashboardItems/mymatches.dart';
import '../homePage/court.dart';
import '../homePage/navigator.dart';
import '../myresults/gamedetail.dart';
import '../screens/login.dart';

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar:AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child:
                Container(
                    child:
                    Icon(Icons.search,size: 25,color: ColorConstant.black901)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child:
                    Icon(Icons.notifications_none_rounded,size: 25,color: ColorConstant.black901)
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:
                    Container(
                        child:Icon(Icons.chat_bubble_outline,size: 25,color: ColorConstant.black901)),
                  )),
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
                                MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
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
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Container(

                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: getHorizontalSize(
                              340.00,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                10.00,
                              ),
                              top: getVerticalSize(
                                30.75,
                              ),
                              bottom: getVerticalSize(
                                30.75,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
     children:[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      6.50,
                                    ),
                                    right: getHorizontalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Events",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.orange900,
                                      fontSize: getFontSize(
                                        24,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      8.00,
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
                                            0.50,
                                          ),
                                          top: getVerticalSize(
                                            1.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Your Next Event",
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
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      23.00,
                                    ),
                                    right: getHorizontalSize(
                                      10.00,
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(onTap:(){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  CourtScreen()),
                                );
                                },
                                        child: Container(
                                          height: getVerticalSize(
                                            190.00,
                                          ),
                                          width: getHorizontalSize(
                                            320.00,
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
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.only(
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
                                                      bottomRight:
                                                      Radius.circular(
                                                        getHorizontalSize(
                                                          0.00,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/beginner.png",
                                                      height: getVerticalSize(
                                                        190.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        320.00,
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        24.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        40.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        24.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        40.00,
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
                                                        Text(
                                                          "Beginner Session",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            fontSize: getFontSize(
                                                              24,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            top: getVerticalSize(
                                                              22.00,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
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
                                                                  height: getSize(
                                                                    20.00,
                                                                  ),
                                                                  width: getSize(
                                                                    20.00,
                                                                  ),
                                                                  child:
                                                                  Image.asset(
                                                                 "assets/images/location.png",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .only(
                                                                  left:
                                                                  getHorizontalSize(
                                                                    6.00,
                                                                  ),
                                                                  right:
                                                                  getHorizontalSize(
                                                                    7.00,
                                                                  ),
                                                                ),
                                                                child: Column(
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
                                                                        "1.5 km away",
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
                                                                          FontWeight.w400,
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
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            7.00,
                                          ),
                                          bottom: getVerticalSize(
                                            8.00,
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
                                                top: getVerticalSize(
                                                  15.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  9.00,
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
                                                      alignment:
                                                      Alignment.center,
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
                                                                getHorizontalSize(
                                                                  12.50,
                                                                ),
                                                              ),
                                                              child:
                                                              Image.asset(
                                                              "assets/images/user1.png",
                                                                height: getSize(
                                                                  25.00,
                                                                ),
                                                                width: getSize(
                                                                  25.00,
                                                                ),
                                                                fit:
                                                                BoxFit.fill,
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
                                                                getHorizontalSize(
                                                                  12.50,
                                                                ),
                                                              ),
                                                              child:
                                                              Image.asset(
                                                                "assets/images/user2.png",
                                                                height: getSize(
                                                                  25.00,
                                                                ),
                                                                width: getSize(
                                                                  25.00,
                                                                ),
                                                                fit:
                                                                BoxFit.fill,
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
                                                                getHorizontalSize(
                                                                  12.50,
                                                                ),
                                                              ),
                                                              child:
                                                              Image.asset(
                                                               "assets/images/user3.png",
                                                                height: getSize(
                                                                  25.00,
                                                                ),
                                                                width: getSize(
                                                                  25.00,
                                                                ),
                                                                fit:
                                                                BoxFit.fill,
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
                                                        6.50,
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
                                                      textAlign:
                                                      TextAlign.center,
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
                                            Container(
                                              margin: EdgeInsets.only(
                                                right: getHorizontalSize(
                                                  15.00,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.orange900,
                                                borderRadius:
                                                BorderRadius.circular(
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
                                                        10.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        9.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        17.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        9.00,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          "Sunday",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            fontSize:
                                                            getFontSize(
                                                              12,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                            top:
                                                            getVerticalSize(
                                                              1.00,
                                                            ),
                                                            right:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "15.00",
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                              ColorConstant
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
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      27.00,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Upcoming Events Near you",
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
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      22.00,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
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
                                                0,
                                                4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(onTap:(){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  CourtScreen()),
                                ); 
                                },
                                              child: Container(
                                                height: getVerticalSize(
                                                  166.00,
                                                ),
                                                width: getHorizontalSize(
                                                  224.00,
                                                ),
                                                child: Card(
                                                  clipBehavior: Clip.antiAlias,
                                                  elevation: 0,
                                                  margin: EdgeInsets.all(0),
                                                  color: ColorConstant.black900,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.only(
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
                                                      bottomRight:
                                                      Radius.circular(
                                                        getHorizontalSize(
                                                          0.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                        Alignment.centerLeft,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                15.00,
                                                              ),
                                                            ),
                                                            topRight:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                15.00,
                                                              ),
                                                            ),
                                                            bottomLeft:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                0.00,
                                                              ),
                                                            ),
                                                            bottomRight:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                0.00,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                         "assets/images/Rectangle 20.png",
                                                            height:
                                                            getVerticalSize(
                                                              166.00,
                                                            ),
                                                            width:
                                                            getHorizontalSize(
                                                              224.00,
                                                            ),
                                                            fit: BoxFit.fill,
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
                                                              19.00,
                                                            ),
                                                            top: getVerticalSize(
                                                              31.00,
                                                            ),
                                                            right:
                                                            getHorizontalSize(
                                                              14.00,
                                                            ),
                                                            bottom:
                                                            getVerticalSize(
                                                              30.00,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                width:
                                                                getHorizontalSize(
                                                                  112.00,
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                  left:
                                                                  getHorizontalSize(
                                                                    3.00,
                                                                  ),
                                                                  right:
                                                                  getHorizontalSize(
                                                                    10.00,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "Friendly Match",
                                                                  maxLines: null,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    fontSize:
                                                                    getFontSize(
                                                                      20,
                                                                    ),
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width:
                                                                getHorizontalSize(
                                                                  160.00,
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                  top:
                                                                  getVerticalSize(
                                                                    19.00,
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
                                                                  MainAxisSize
                                                                      .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                        top:
                                                                        getVerticalSize(
                                                                          2.00,
                                                                        ),
                                                                        bottom:
                                                                        getVerticalSize(
                                                                          10.00,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                      Container(
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
                                                                          "assets/images/location.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      ),
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
                                                                          TextOverflow.ellipsis,
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style:
                                                                          TextStyle(
                                                                            color:
                                                                            ColorConstant.whiteA700,
                                                                            fontSize:
                                                                            getFontSize(
                                                                              13,
                                                                            ),
                                                                            fontFamily:
                                                                            'Inter',
                                                                            fontWeight:
                                                                            FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.only(
                                                                            top:
                                                                            getVerticalSize(
                                                                              6.00,
                                                                            ),
                                                                            right:
                                                                            getHorizontalSize(
                                                                              10.00,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                          Text(
                                                                            "1 km away",
                                                                            overflow:
                                                                            TextOverflow.ellipsis,
                                                                            textAlign:
                                                                            TextAlign.left,
                                                                            style:
                                                                            TextStyle(
                                                                              color:
                                                                              ColorConstant.whiteA700,
                                                                              fontSize:
                                                                              getFontSize(
                                                                                12,
                                                                              ),
                                                                              fontFamily:
                                                                              'Inter',
                                                                              fontWeight:
                                                                              FontWeight.w400,
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
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  18.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  16.00,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        19.00,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      alignment:
                                                      Alignment.center,
                                                      height: getVerticalSize(
                                                        22.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        61.00,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .indigo900,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                          getHorizontalSize(
                                                            5.00,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Join",
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          fontSize: getFontSize(
                                                            10,
                                                          ),
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                          FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        31.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        4.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        16.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        5.00,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      " Entry Fee: ₹200",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .orange900,
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
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            19.00,
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
                                                0,
                                                4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: getVerticalSize(
                                                  166.00,
                                                ),
                                                width: getHorizontalSize(
                                                  224.00,
                                                ),
                                                child: Card(
                                                  clipBehavior: Clip.antiAlias,
                                                  elevation: 0,
                                                  margin: EdgeInsets.all(0),
                                                  color: ColorConstant.black900,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.only(
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
                                                      bottomLeft:
                                                      Radius.circular(
                                                        getHorizontalSize(
                                                          0.00,
                                                        ),
                                                      ),
                                                      bottomRight:
                                                      Radius.circular(
                                                        getHorizontalSize(
                                                          0.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                    Alignment.centerRight,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                15.00,
                                                              ),
                                                            ),
                                                            topRight:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                15.00,
                                                              ),
                                                            ),
                                                            bottomLeft:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                0.00,
                                                              ),
                                                            ),
                                                            bottomRight:
                                                            Radius.circular(
                                                              getHorizontalSize(
                                                                0.00,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                          "assets/images/beginner.png",
                                                            height:
                                                            getVerticalSize(
                                                              166.00,
                                                            ),
                                                            width:
                                                            getHorizontalSize(
                                                              224.00,
                                                            ),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Container(
                                                          width:
                                                          getHorizontalSize(
                                                            183.00,
                                                          ),
                                                          margin:
                                                          EdgeInsets.only(
                                                            left:
                                                            getHorizontalSize(
                                                              14.00,
                                                            ),
                                                            top:
                                                            getVerticalSize(
                                                              31.00,
                                                            ),
                                                            right:
                                                            getHorizontalSize(
                                                              14.00,
                                                            ),
                                                            bottom:
                                                            getVerticalSize(
                                                              31.00,
                                                            ),
                                                          ),
                                                          child: Column(
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
                                                              Container(
                                                                width:
                                                                getHorizontalSize(
                                                                  130.00,
                                                                ),
                                                                margin:
                                                                EdgeInsets
                                                                    .only(
                                                                  left:
                                                                  getHorizontalSize(
                                                                    1.00,
                                                                  ),
                                                                  right:
                                                                  getHorizontalSize(
                                                                    10.00,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "Seasonal\nChampionship",
                                                                  maxLines:
                                                                  null,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    fontSize:
                                                                    getFontSize(
                                                                      20,
                                                                    ),
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width:
                                                                getHorizontalSize(
                                                                  183.00,
                                                                ),
                                                                margin:
                                                                EdgeInsets
                                                                    .only(
                                                                  top:
                                                                  getVerticalSize(
                                                                    19.00,
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
                                                                  MainAxisSize
                                                                      .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                        top:
                                                                        getVerticalSize(
                                                                          2.00,
                                                                        ),
                                                                        bottom:
                                                                        getVerticalSize(
                                                                          15.00,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                      Container(
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
                                                                       "assets/images/location.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      ),
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
                                                                          "Club name/ sports center",
                                                                          overflow:
                                                                          TextOverflow.ellipsis,
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style:
                                                                          TextStyle(
                                                                            color:
                                                                            ColorConstant.whiteA700,
                                                                            fontSize:
                                                                            getFontSize(
                                                                              13,
                                                                            ),
                                                                            fontFamily:
                                                                            'Inter',
                                                                            fontWeight:
                                                                            FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.only(
                                                                            top:
                                                                            getVerticalSize(
                                                                              6.00,
                                                                            ),
                                                                            right:
                                                                            getHorizontalSize(
                                                                              10.00,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                          Text(
                                                                            "0.5 km away",
                                                                            overflow:
                                                                            TextOverflow.ellipsis,
                                                                            textAlign:
                                                                            TextAlign.left,
                                                                            style:
                                                                            TextStyle(
                                                                              color: ColorConstant.whiteA700,
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
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: getHorizontalSize(
                                                    28.00,
                                                  ),
                                                  top: getVerticalSize(
                                                    18.00,
                                                  ),
                                                  right: getHorizontalSize(
                                                    28.00,
                                                  ),
                                                  bottom: getVerticalSize(
                                                    16.00,
                                                  ),
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: getVerticalSize(
                                                    22.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    61.00,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                    ColorConstant.indigo900,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      getHorizontalSize(
                                                        5.00,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Join",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      fontSize: getFontSize(
                                                        10,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                      FontWeight.w400,
                                                    ),
                                                  ),
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      30.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      30.00,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        2.91,
                      ),
                      bottom: getVerticalSize(
                        3.91,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        29.18,
                      ),
                      width: getSize(
                        29.18,
                      ),
                      // child: SvgPicture.asset(
                      //   ImageConstant.imgVector4,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        4.46,
                      ),
                      bottom: getVerticalSize(
                        2.37,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        29.17,
                      ),
                      width: getHorizontalSize(
                        26.25,
                      ),
                      // child: SvgPicture.asset(
                      //   ImageConstant.imgVector5,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: getVerticalSize(
                        1.00,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        35.00,
                      ),
                      width: getSize(
                        35.00,
                      ),
                      // child: SvgPicture.asset(
                      //   ImageConstant.imgBxmessagesqua,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        1.00,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        35.00,
                      ),
                      width: getSize(
                        35.00,
                      ),
                      // child: SvgPicture.asset(
                      //   ImageConstant.imgBxuserpin,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
