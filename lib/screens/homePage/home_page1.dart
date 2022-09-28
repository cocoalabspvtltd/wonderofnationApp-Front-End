import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/screens/homePage/sport_Academy.dart';
import '../../apis/repositories/logoout_repositories.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../addClubs/my_clubs.dart';
import '../addfriends/add_fried.dart';

import '../chat/chat_screen.dart';

import '../dashboardItems/about.dart';
import '../dashboardItems/help.dart';
import '../dashboardItems/my_matches.dart';
import '../dashboardItems/privacy.dart';
import '../dashboardItems/settingd.dart';
import '../login.dart';
import '../matches/club_list_joining.dart';
import '../myresults/game_detail.dart';
import '../payment_dash/payment_page.dart';
import 'court.dart';
import 'home_item.dart';
import 'levelling2.dart';
import 'navigator.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.RegisterName, }) : super(key: key);
final String RegisterName;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int radioGroup = 1;

  int radioGroup1 = 1;

  @override
  LogoutRepository LogOut = LogoutRepository();
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
    
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(height: 100,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                            child: GestureDetector(onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: widget.RegisterName,)),
                              );
                            },
                                child: Icon(CupertinoIcons.clear_circled)
                )
                      ),
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
                        MaterialPageRoute(builder: (context) =>  MyMatches()),
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
                    GestureDetector(onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>MyClubs()));

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>GameDetail()));
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethod(

                              )),
                        );
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
                    GestureDetector(onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>Settingpage()));

                    },
                      child: Text(
                        "Settings",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPage()));
                      },
                      child: Text(
                        "Privacy & Security",
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
                        "assets/images/help.png",color:Colors.black,
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
                                builder: (context) => HelpPage()));
                      },
                      child: Text(
                        "Help",
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
                        "assets/images/about.png",height: 20,
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
                                builder: (context) => AboutIUsPage()));
                      },
                      child: Text(
                        "About us",
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
                      child: Icon(
                          Icons.logout,color:Colors.black
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(onTap: (){
                     // LogOut.getLogoutRepository(context);
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("HELLO , ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                            register_buuton=="Start Playing" ?
                            Text(" ${widget.RegisterName.toUpperCase()}",style: TextStyle(color: ColorConstant.green6320),):
                            Text(" ${name.toUpperCase()}",style: TextStyle(color: ColorConstant.green6320),),
                            Spacer(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              23.00,
                            ),
                            top: getVerticalSize(
                              8.00,
                            ),
                          ),
                          child: Text(
                            "Create your matches",
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
                                  190.00,
                                ),
                                width: getHorizontalSize(
                                  320.00,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           CourtScreen()),
                                          // );
                                        },
                                        child: Container(
                                          height: getVerticalSize(
                                            170.00,
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
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Image.asset(
                                                    "assets/images/seasonalchampionship.png",
                                                    height: getVerticalSize(
                                                      170.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      320.00,
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        20.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        20.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        14.00,
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
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                          getHorizontalSize(
                                                            166.00,
                                                          ),
                                                          margin:
                                                          EdgeInsets.only(
                                                            right:
                                                            getHorizontalSize(
                                                              10.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Book Your\nCourt Now",
                                                            maxLines: null,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                              ColorConstant
                                                                  .whiteA700,
                                                              fontSize:
                                                              getFontSize(
                                                                26,
                                                              ),
                                                              fontFamily:
                                                              'Inter',
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                          "Lorem ipsum dolor sit amet, consectetur adipiscing \nelit.Ullamcorper pellentesque hac.",
                                                          maxLines: null,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                            color:
                                                            ColorConstant
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
                                      child: GestureDetector(onTap:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  ClubList()),
                                        );
                                      },
                                        child: Container(
                                            width: 80,
                                            height: 40,
                                            margin: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                11.00,
                                              ),
                                              top: getVerticalSize(
                                                7.00,
                                              ),
                                              right: getHorizontalSize(
                                                11.00,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.green6320,
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  5.00,
                                                ),
                                              ),
                                            ),
                                            child: Center(child: Text("Book Now",style: TextStyle(color: Colors.white),))
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,bottom: 10,
                                ),
                                child:Text("24*7 Online booking",style: TextStyle(fontSize: 12),
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
                                                    ColorConstant.green6320,
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
                                    color: ColorConstant.black900,
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
                                          42.00,
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
                                          child: Icon(Icons.add_circle_outline_rounded,size: 50,)
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
                                child:
                                HomeItemWidget()
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
                                    color: ColorConstant.green6320,
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
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 170,
                          child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int i) {
                              return SizedBox(
                                width: 200,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  CourtScreen()),
                                    );
                                  },
                                  child: Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(7),
                                                  topRight: Radius.circular(7)),
                                              child: Image.asset(
                                                "assets/images/seasonalchampionship.png",fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              top: 30,
                                              child: Text(
                                                "Friendly \nMatch",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    18,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 75,
                                                left: 18,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/location.png"),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Club Name/ Sports Center",
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            color: ColorConstant.whiteA700,
                                                            fontSize: getFontSize(
                                                              13,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          "3.5 km away",
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            color: ColorConstant.whiteA700,
                                                            fontSize: getFontSize(
                                                              12,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Stack(
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
                                                          14.00,
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
                                                          25.00,
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
                                            Text(
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
                                            Spacer(),
                                            Text(
                                              "Fee: ₹500",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.green6320,
                                                fontSize: getFontSize(
                                                  12,
                                                ),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 4,)
                                          ],
                                        ),
                                        SizedBox(height: 4,),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
                              