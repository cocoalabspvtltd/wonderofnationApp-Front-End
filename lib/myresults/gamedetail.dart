import 'package:flutter/material.dart';

import 'package:oo/myresults/gameslist.dart';
import 'package:oo/myresults/scoreboard.dart';

class Gamedetail extends StatefulWidget {
  const Gamedetail({Key? key}) : super(key: key);

  @override
  State<Gamedetail> createState() => _GamedetailState();
}

class _GamedetailState extends State<Gamedetail> {
  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => Gameslist()));
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 100, left: 80),
          child: Text(
            "Tennis", style: TextStyle(color: Colors.black, fontSize: 15),),
        ),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Scoreboard()));
                                },
                                child: Container(
                                    height: 130,
                                    width: 267,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 0.0,left: 180),
                                          child: Text(
                                            "12 hrs left",
                                            style:
                                            TextStyle(color: Colors.orange, fontSize: 11),
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
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0, top: 4),
                                              child: Image.asset(
                                                "assets/images/location.png",
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 70),
                                              child: Text("Club name/Sport Centre"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            SizedBox(width: 5,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 25, top: 4),
                                              child: Text("2.5 km away"),
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 5.0, top: 4),
                                              child: Image.asset(
                                                "assets/images/calender.png",
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 10.0, top: 4),
                                              child: Text("04.07.22"),
                                            ),
                                            SizedBox(height: 20,),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:3),
                              child: Container(
                                height: 130,
                                width:90,
                                decoration: BoxDecoration(
                                    color: Colors.green[900],
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Center(child: Text("Won",style: TextStyle(color: Colors.white),)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );

                  }),
            ],
          ),
        ),
      ),
    );
  }
}