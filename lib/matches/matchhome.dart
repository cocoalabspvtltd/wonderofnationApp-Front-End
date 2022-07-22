import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oo/homePage/navigator.dart';
import 'package:oo/matches/matchcourt.dart';

import '../addClubs/myclubs.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';

import '../dashboardItems/mymatches.dart';
import '../dropdowns/gamesdropdown.dart';
import '../myresults/gamedetail.dart';
import '../myresults/gameslist.dart';
import '../screens/login.dart';

class Matchhome extends StatefulWidget {
  const Matchhome({Key? key}) : super(key: key);

  @override
  State<Matchhome> createState() => _MatchhomeState();

}

class _MatchhomeState extends State<Matchhome> {
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

  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];
  TextEditingController dateinputcontroller=new TextEditingController(
      text: DateTime.now().toString());
  var date;
  var _valueToValidate3;
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
              child: Container(child: Icon(Icons.search,size: 25,color: ColorConstant.black901)
                // Image.asset("assets/images/search.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(child:Icon(Icons.notifications_none_rounded,size: 25,color: ColorConstant.black901)),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(child: Icon(Icons.chat_bubble_outline,size: 25,color: ColorConstant.black901)),
            ),
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
      body: SingleChildScrollView(
        child: Padding( padding: EdgeInsets.only(
          top: getVerticalSize(
            33.50,
          ),
          bottom: getVerticalSize(
            20.00,
          ),
        ),
          child: Column(
            children: [
              Container(
                width: getHorizontalSize(
                  140.00,
                ),
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    0.00,
                  ),
                  right: getHorizontalSize(
                    170.00,
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create your \n',
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
                        text: 'matches',
                        style: TextStyle(
                          color: ColorConstant.orange900,
                          fontSize: getFontSize(
                            24,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    24.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: getVerticalSize(
                        40.00,
                      ),
                      width: getHorizontalSize(
                        100.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        bottom: getVerticalSize(
                          1.00,
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
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            14.00,
                          ),
                          top: getVerticalSize(
                            13.00,
                          ),
                          bottom: getVerticalSize(
                            12.00,
                          ),
                        ),
                        child:designationdropdown(),
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: DateTimePicker(
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                          prefixIcon: Icon(Icons.calendar_month,color: Colors.orange[700],size: 18,),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color:
                              ColorConstant.black900,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color:
                              ColorConstant.black900,
                            ),
                          ),
                        ),
                        type: DateTimePickerType.date,
                        dateMask: 'dd.MM.yy',
                        controller:dateinputcontroller ,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2060),
                        onChanged: (val) => setState(() => date = val),
                        validator: (val) {
                          setState(() => _valueToValidate3 = val ?? '');
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: TextFormField(
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                          prefixIcon: IconButton(onPressed: _show, icon: Icon(Icons.access_time,color: Colors.orange[700],size: 20,)),
                          label: Text(_selectedTime != null ? _selectedTime! : 'Select',
                            style: TextStyle(fontSize: 13,color: Colors.black),),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.black900,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 45),
                  primary:  ColorConstant.orange900,
                  elevation: 2,
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10.0)
                  ),),
                onPressed: (){},
                child: Text(
                  "Search",
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text("Find Your Court",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 0.60 / 0.90,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Matchcourt()));
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 160,),
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Text("Tennis court",
                                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontSize: 13 ),),
                              ),
                              SizedBox(height: 3,),
                              Padding(
                                padding: const EdgeInsets.only(right: 70),
                                child: Text("1 km Away",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontSize: 13 )),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Text("₹2000",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontSize: 16 )),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage("assets/images/football.jpg",),
                                fit: BoxFit.fill
                            ),),
                        ),
                      );}),
              ),
              SizedBox(height: 20,),
              Text(
                "See all",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}