import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/dashboardItems/pastmatches.dart';
import 'package:oo/dashboardItems/upcomingmathches.dart';
import 'package:oo/homePage/navigator.dart';


import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class mymatches extends StatefulWidget {
  const mymatches({Key? key}) : super(key: key);

  @override
  State<mymatches> createState() => _mymatchesState();
}

class _mymatchesState extends State<mymatches> {
  bool a = false;
  bool b= false;
  String mText1 = "See All";
  String mText2="See All";
  @override
  ListView _jobsListView() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _tile();
        });
  }

  SizedBox _tile() => SizedBox(
    height: 150,
    child: Card(
      margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 2),
      elevation: 2,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      shadowColor: Colors.grey,
      child: ListTile(
          title: Text("hj",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              )),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${"subtitle"}",
                  style: TextStyle(color: Colors.red[900], fontSize: 20),
                ),
                Text(
                  "${"subtitle1"}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  "Prescribed By${"subtitle2"}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ]),
          onTap: () {}),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 68.0),
          child: Text(
            "My Matches",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        leading: GestureDetector(onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  DashBoard()),
          );
        },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 200.0, top: 28),
              child: Text("Upcoming matches",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 20,),
            a == true ?
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch()));
                      },
                      child: Container(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: 82,
                                child: Image.asset("assets/images/matches.png",fit: BoxFit.fitHeight,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 160,bottom: 5),
                                    child: Text("12 hrs left", style: TextStyle(color: Colors.orange, fontSize: 12),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70,bottom: 10),
                                    child: Text(
                                      "Beginner Session",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/location.png",
                                          color: Colors.black,
                                        ),
                                        Text("Club name/Sport Centre"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 80),
                                    child: Text("1.5 km away"),
                                  ),
                                  SizedBox(height: 6,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width: 4,),
                                        Text("03/06/2022"),
                                        SizedBox(width: 9,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width: 4,),
                                        Text("3:00"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            )
                :Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch()));
                },
                child: Container(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    shadowColor: Colors.grey,
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 82,
                          child: Image.asset("assets/images/matches.png",fit: BoxFit.fitHeight,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 160,bottom: 5),
                              child: Text("12 hrs left", style: TextStyle(color: Colors.orange, fontSize: 12),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 70,bottom: 10),
                              child: Text(
                                "Beginner Session",
                                style: new TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/location.png",
                                    color: Colors.black,
                                  ),
                                  Text("Club name/Sport Centre"),
                                ],
                              ),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text("1.5 km away"),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Image.asset("assets/images/calender.png", color: Colors.black,),
                                  SizedBox(width: 4,),
                                  Text("03/06/2022"),
                                  SizedBox(width: 9,),
                                  Icon(Icons.lock_clock, color: Colors.black,),
                                  SizedBox(width: 4,),
                                  Text("3:00"),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ) ,
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                _visibilitymethod1();
              },
              child: Text(
                mText1,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 250.0, top: 19),
              child: Text(
                "Past Matches",
                style: TextStyle(color: Colors.black,fontSize: 14),
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.grey,),
            SizedBox(height: 20,),
            b == true ?
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Pastmatches()));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: 82,
                                child: Image.asset("assets/images/match1.png",fit: BoxFit.fitHeight,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 160,bottom: 5),
                                    child: Text("12 hrs left", style: TextStyle(color: Colors.orange, fontSize: 12),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70,bottom: 10),
                                    child: Text(
                                      "Beginner Session",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/location.png",
                                          color: Colors.black,
                                        ),
                                        Text("Club name/Sport Centre"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 80),
                                    child: Text("1.5 km away"),
                                  ),
                                  SizedBox(height: 6,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width: 4,),
                                        Text("03/06/2022"),
                                        SizedBox(width: 9,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width: 4,),
                                        Text("3:00"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            )
                :   Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                shadowColor: Colors.grey,
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 82,
                      child: Image.asset("assets/images/matches.png",fit: BoxFit.fitHeight,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 160,bottom: 5),
                          child: Text("12 hrs left", style: TextStyle(color: Colors.orange, fontSize: 12),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 70,bottom: 10),
                          child: Text(
                            "Beginner Session",
                            style: new TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/location.png",
                                color: Colors.black,
                              ),
                              Text("Club name/Sport Centre"),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: Text("1.5 km away"),
                        ),
                        SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Image.asset("assets/images/calender.png", color: Colors.black,),
                              SizedBox(width: 4,),
                              Text("03/06/2022"),
                              SizedBox(width: 9,),
                              Icon(Icons.lock_clock, color: Colors.black,),
                              SizedBox(width: 4,),
                              Text("3:00"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                _visibilitymethod2();
              },
              child: Text(
                mText2,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
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
  void _visibilitymethod2() {
    setState(() {
      if (b) {
        b = false;
        mText2 = "See All";
      } else {
        b= true;
        mText2 = "See hide";
      }
    });
  }
}