import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/homePage/navigator.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class mymatches extends StatefulWidget {
  const mymatches({Key? key}) : super(key: key);

  @override
  State<mymatches> createState() => _mymatchesState();
}

class _mymatchesState extends State<mymatches> {
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
              child: Text("Upcoming Matches"),
            ),
            Container(
              height: getVerticalSize(
                0.50,
              ),
              width: getHorizontalSize(
                320.00,
              ),
              margin: EdgeInsets.only(
                top: getVerticalSize(
                  16.00,
                ),
                left: 20,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.indigo900,
              ),
            ),
            Card(
              margin: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 2),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              shadowColor: Colors.grey,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 82,
                    child: Image.asset("assets/images/matches.png"),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              "12 hrs left",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Text(
                            "Beginner Session",
                            style: new TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 4),
                              child: Image.asset(
                                "assets/images/location.png",
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text("Club name/Sport Centre"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 4),
                          child: Text("1.5 km away"),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Image.asset(
                                "assets/images/calender.png",
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Text("03/06/2022"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Icon(
                                Icons.lock_clock,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Text("3:00"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text(
              "See all",
              style: TextStyle(color: Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0, top: 19),
              child: Text(
                "Past Matches",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              height: getVerticalSize(
                0.50,
              ),
              width: getHorizontalSize(
                320.00,
              ),
              margin: EdgeInsets.only(
                top: getVerticalSize(
                  16.00,
                ),
                left: 20,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.indigo900,
              ),
            ),
            Card(
              margin: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 2),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              shadowColor: Colors.grey,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 82,
                    child: Image.asset("assets/images/matches.png"),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              "12 hrs left",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Text(
                            "Beginner Session",
                            style: new TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 4),
                              child: Image.asset(
                                "assets/images/location.png",
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text("Club name/Sport Centre"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 4),
                          child: Text("1.5 km away"),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Image.asset(
                                "assets/images/calender.png",
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Text("03/06/2022"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Icon(
                                Icons.lock_clock,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4),
                              child: Text("3:00"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
