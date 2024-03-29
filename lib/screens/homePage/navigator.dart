import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oo/apis/bloc/notification_bloc.dart';
import 'package:oo/apis/repositories/notification_repositories.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/screens/Event/Events.dart';
import 'package:oo/screens/addClubs/my_clubs.dart';
import 'package:oo/screens/chat/chat_screen.dart';
import 'package:oo/screens/dashboardItems/about.dart';
import 'package:oo/screens/dashboardItems/contact.dart';
import 'package:oo/screens/dashboardItems/faq.dart';
import 'package:oo/screens/dashboardItems/historymatch.dart';
import 'package:oo/screens/dashboardItems/my_matches.dart';
import 'package:oo/screens/dashboardItems/privacy.dart';
import 'package:oo/screens/dashboardItems/settingd.dart';
import 'package:oo/screens/homePage/home_page1.dart';
import 'package:oo/screens/login.dart';
import 'package:oo/screens/matches/club_list_joining.dart';
import 'package:oo/screens/myresults/game_detail_screen.dart';
import 'package:oo/screens/dashboardItems/history_screen.dart';
import 'package:oo/screens/myresults/myresult.dart';
import 'package:oo/screens/notification/notification_screen.dart';
import 'package:oo/screens/profile/profile_page.dart';

import '../../constants/sharedpref.dart';

class DashBoard extends StatefulWidget {
  final int selectedIndex;
  const DashBoard({Key? key, required this.UserName1, this.selectedIndex= 0,}) : super(key: key);
  final String UserName1;
  @override
  State<DashBoard> createState() => _DashBoardState();
}
class _DashBoardState extends State<DashBoard> {
  @override
  late NotificationBloc _bloc;
  NotificationRepository notifi_api= NotificationRepository();
  void initState() {
    super.initState();
    _bloc =NotificationBloc();
    _bloc.getNotification(false);
    notifi_api.getnotification(1, 20);
    _selectedIndex = widget.selectedIndex;
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _selectedIndex = 0;
  DateTime? currentBackPressTime;
  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              child: InkWell(
                onTap: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Stack(
                  children: [
                    Container(
                        child:
                        Icon(Icons.notifications_none_rounded,size: 25,color: ColorConstant.black901)
                    ),
              Positioned(
                right: 0,
                child:  Container(
                  padding: EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 13,
                    minHeight: 13,
                  ),
                  child: new Text(
                    "${notificationCount}",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),),
                  ],
                ),
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
      drawer: _drawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[50],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConstant.green6320,
        onTap: _onTappedItem,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle:TextStyle(fontWeight: FontWeight.w500) ,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons. home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Events",
            icon:  Icon(Icons.event_available),
          ),
          BottomNavigationBarItem(
            label: "Match",
            icon: Icon(Icons.add_card_outlined),
          ),
          BottomNavigationBarItem(
              label: "Profile",
              icon:  Icon(Icons.account_box_outlined,)
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: () {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
              currentBackPressTime = now;
              Text("Double press back to exit");
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: _selectedIndex == 3
              ? ProfileUi()
              : _selectedIndex == 2
              ? ClubList()
              : _selectedIndex == 1
              ? events()
              : _selectedIndex == 0
              ? HomePage(RegisterName: widget.UserName1)
              : Center(child: Text("hai"))),
    );
  }
  Widget _drawer() {
    return  Drawer(
      backgroundColor: ColorConstant.whiteA700,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                            child: Icon(CupertinoIcons.clear_circled))),
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
                      MaterialPageRoute(builder: (context) => MyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '',)),
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
                        MaterialPageRoute(builder: (context) => MyClubs()));
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
                            builder: (context) => MyResultScreen()));
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
                    "assets/images/history.png",width: 30,height: 20,
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
                          builder: (context) => HistoryMyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '')),
                    );
                  },
                  child: Text(
                    "History",
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settingpage()),
                );
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
                  child:
                    Icon(Icons.call,color: Colors.black,size: 20,),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactPage()));
                  },
                  child: Text(
                    "Contact us",
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
                    "assets/images/faq.png",
                    color: Colors.black,
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
                            builder: (context) => FaqPage()));
                  },
                  child: Text(
                    "FAQ",
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
                    "assets/images/about.png",
                    height: 20,
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
                  child: Icon(Icons.logout, color: Colors.black),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Are you sure want to log out?',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          actions: [
                            OutlinedButton(
                              child: Text('No'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Get.back();
                                SharedPrefs.logOut();
                              },
                            ),
                          ],
                        );
                      },
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
    );
  }
}