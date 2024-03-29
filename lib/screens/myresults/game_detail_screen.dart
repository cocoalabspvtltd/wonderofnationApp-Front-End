import 'package:flutter/material.dart';
import 'package:oo/screens/homePage/navigator.dart';

import '../../constants/colors.dart';



class GameDetailScreen extends StatefulWidget {
  var games;
  GameDetailScreen({this.games,Key? key}) : super(key: key);

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashBoard(UserName1: '')));
            }
        ),
        centerTitle: true,
        title: Text(
          "Results", style: TextStyle(color: Colors.black, fontSize: 15),),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  height: screenHeight * 0.15,
                                  width: screenWidth * 0.65,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0.0,left: 180),
                                        child: Text(
                                          "12 days left",
                                          style:
                                          TextStyle(color: ColorConstant.green6320, fontSize: 11),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0,),
                                        child: Text(
                                          "Friendly Match",
                                          style: new TextStyle(
                                              fontSize: 15.0, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 10,),
                                          Image.asset(
                                            "assets/images/location.png",
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("Club name/Sport Centre"),
                                        ],
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                          Text("2.5 km away"),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                                          Image.asset(
                                            "assets/images/calender.png",
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                                          Text("04.07.22"),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:3),
                              child: Container(
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.23,
                                decoration: BoxDecoration(
                                    color: Colors.green[900],
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Center(child: Text("Won",style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left:3),
                            //   child: Container(
                            //     height: screenHeight * 0.15,
                            //     width: screenWidth * 0.23,
                            //     decoration: BoxDecoration(
                            //         color: Colors.red[900],
                            //         borderRadius: BorderRadius.all(Radius.circular(5))
                            //     ),
                            //     child: Center(child: Text("Lost",style: TextStyle(color: Colors.white),)),
                            //   ),
                            // )
                          ],
                        ),
                      );

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}