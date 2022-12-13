import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/screens/dashboardItems/past_matches.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import 'package:oo/screens/homePage/navigator.dart';



class MyMatches extends StatefulWidget {
  const MyMatches({Key? key}) : super(key: key);

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches> {
  bool a = false;
  bool b= false;
  String mText1 = "See All";
  String mText2="See All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "My Matches",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        leading: GestureDetector(onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
          );
        },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upcoming matches",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
              Divider(color: Colors.grey,),
              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
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
                    return GestureDetector(
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: 150),
                                      child: Text("12 hrs left",
                                        style: TextStyle(
                                            color: ColorConstant.green6320, fontSize: 12),),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                                    Text(
                                      "Beginner Session",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/location.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("Club name/Sport Centre"),
                                      ],
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Text("1.5 km away"),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("03/06/2022"),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("3:00"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )
                  : GestureDetector(
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: 150),
                                child: Text("12 hrs left",
                                  style: TextStyle(
                                      color: ColorConstant.green6320, fontSize: 12),),
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                              Text(
                                "Beginner Session",
                                style: new TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Row(
                                children: [
                                  Image.asset("assets/images/location.png", color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("Club name/Sport Centre"),
                                ],
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Text("1.5 km away"),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Row(
                                children: [
                                  Image.asset("assets/images/calender.png", color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("03/06/2022"),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                  Icon(Icons.lock_clock, color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("3:00"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ) ,
              SizedBox(height: 10,),
              InkWell(
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: 150),
                                      child: Text("12 hrs left",
                                        style: TextStyle(
                                            color: ColorConstant.green6320, fontSize: 12),),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                                    Text(
                                      "Beginner Session",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/location.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("Club name/Sport Centre"),
                                      ],
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Text("1.5 km away"),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("03/06/2022"),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("3:00"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )
                  :   GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Pastmatches()));
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: 150),
                                child: Text("12 hrs left",
                                  style: TextStyle(
                                      color: ColorConstant.green6320, fontSize: 12),),
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                              Text(
                                "Beginner Session",
                                style: new TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Row(
                                children: [
                                  Image.asset("assets/images/location.png", color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("Club name/Sport Centre"),
                                ],
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Text("1.5 km away"),
                              SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                              Row(
                                children: [
                                  Image.asset("assets/images/calender.png", color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("03/06/2022"),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                  Icon(Icons.lock_clock, color: Colors.black,),
                                  SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                  Text("3:00"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  _visibilitymethod2();
                },
                child: Center(
                  child: Text(
                    mText2,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
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