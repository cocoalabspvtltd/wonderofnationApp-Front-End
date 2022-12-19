import 'package:flutter/material.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/screens/homePage/home_page1.dart';

import '../../constants/colors.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  bool a = false;
  String mText1 = "See All";
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 23
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("History",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height * 0.02,),
                Text("Your matches",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
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
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7.0),
                                  bottomLeft: Radius.circular(7.0),
                                ),
                                child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
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
                                        Text("Club name/Sport Centre",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Text("1.5 km away",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("03/06/2022",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("3:00",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                )
                    :
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7.0),
                                  bottomLeft: Radius.circular(7.0),
                                ),
                                child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
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
                                        Text("Club name/Sport Centre",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Text("1.5 km away",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/calender.png", color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("03/06/2022",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                        Icon(Icons.lock_clock, color: Colors.black,),
                                        SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                        Text("3:00",style:  TextStyle(
                                            fontSize: 14.0, fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
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

              ],
            ),
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
}


class OrderPlaced extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Confirmation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage(RegisterName: "")),
            );
          },
          icon: Icon(Icons.arrow_back,),
        ),


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child:
            Container(height: 40,width: 40,
                margin: EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/tick.png'),
                      fit: BoxFit.fill),
                )
            ),

            ),
            Container(
              child: Text("Your Order has been placed successfully",style: TextStyle(fontSize:20),),
            ),
            Container(
              child: Text("Submitted!!",style: TextStyle(fontSize:20),),
            ),SizedBox(
              height: 30,
            ),

            // Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.primaryColor,),
            //     height: 50,width: 200,
            //     child:TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         "Tracking",
            //         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            //       ),
            //     )
            // ),
            SizedBox(height: 60),
            Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.green,),
                height: 50,width:50,
                child:TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(RegisterName: "")),
                    );
                  },
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:80),
                  ),
                )
            )


          ],
        ),
      ),
    );
  }
}