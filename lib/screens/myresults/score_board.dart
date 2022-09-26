import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';
import 'game_detail.dart';


class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
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
              Navigator.pop(context);
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 100, left: 80),
          child: Text(
            "Score Borad", style: TextStyle(color: Colors.black, fontSize: 15),),
        ),),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              height: screenHeight * 0.13,
                              width: screenWidth * 0.65,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 0.0,left: 180),
                                  //   child: Text(
                                  //     "12 days left",
                                  //     style:
                                  //     TextStyle(color: ColorConstant.green6320, fontSize: 11),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0,),
                                    child: Text(
                                      "Friendly Match",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
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
                                  SizedBox(height: 4,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 33,),
                                      Text("2.5 km away"),
                                      SizedBox(width: 10,),
                                      Image.asset(
                                        "assets/images/calender.png",
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 8,),
                                      Text("04.07.22"),
                                      SizedBox(height: 20,),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.13,
                          width: screenWidth * 0.20,
                          decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Center(child: Text("Won",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
                    child: DataTable(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      columnSpacing: 25,
                      columns: [
                        DataColumn(
                          label: Text('Players'),
                        ),
                        DataColumn(
                          label: Text('Set 1'),
                        ),
                        DataColumn(
                          label: Text('Set 2'),
                        ),
                        DataColumn(
                          label: Text('Set 3'),
                        ),
                        DataColumn(
                          label: Text('Total'),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Jacob')),
                          DataCell(Text('7')),
                          DataCell(Text('8')),
                          DataCell(Text('2')),
                          DataCell(Text('35')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Alex')),
                          DataCell(Text('5')),
                          DataCell(Text('4')),
                          DataCell(Text('1')),
                          DataCell(Text('20')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Michael')),
                          DataCell(Text('7')),
                          DataCell(Text('8')),
                          DataCell(Text('2')),
                          DataCell(Text('35')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Liyakath')),
                          DataCell(Text('5')),
                          DataCell(Text('4')),
                          DataCell(Text('1')),
                          DataCell(Text('20')),
                        ])
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  DataTable(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        // right: Divider.createBorderSide(context, width: 5.0),
                        // left: Divider.createBorderSide(context, width: 5.0)
                      ),
                    ),
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                        label: Text('Players'),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 50,right: 50),
                          child: Text('Result'),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Jacob')),
                        DataCell(Container
                          (
                            height: 60,
                            width: 130,
                            color: Colors.green,
                            child: Center(child: Text('Won',style: TextStyle(color: Colors.white),)))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Alex')),
                        DataCell(
                            Container(
                                height: 60,
                                width: 130,
                                color: Colors.red[900],
                                child: Center(child: Text('Lost',style: TextStyle(color: Colors.white),)))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Michael')),
                        DataCell(Container(
                            height: 60,
                            width: 130,
                            color: Colors.green,
                            child: Center(child: Text('Won',style: TextStyle(color: Colors.white),)))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Liyakath')),
                        DataCell(Container( height: 60,
                            width: 130,
                            color: Colors.red[900],
                            child: Center(child: Text('Lost',style: TextStyle(color: Colors.white),)))),
                      ])
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}