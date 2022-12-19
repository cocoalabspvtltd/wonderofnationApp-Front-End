import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/screens/dashboardItems/past_matches.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';

import 'my_matches.dart';


class UpdateResult extends StatefulWidget {
  const UpdateResult({Key? key}) : super(key: key);

  @override
  State<UpdateResult> createState() => _UpdateResultState();
}

class _UpdateResultState extends State<UpdateResult> {
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
                  MaterialPageRoute(builder: (context) => Pastmatches()));
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 100, left: 80),
          child: Text(
            "Score Borad", style: TextStyle(color: Colors.black, fontSize: 15),),
        ),),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
                  child: DataTable(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    columnSpacing: 20,
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
                SizedBox(height: 30,),
                DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      // right: Divider.createBorderSide(context, width: 5.0),
                      // left: Divider.createBorderSide(context, width: 5.0)
                    ),
                  ),
                  columnSpacing: 40,
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
                          color: Colors.green[900],
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
                          color: Colors.green[900],
                          child: Center(child: Text('Won',style: TextStyle(color: Colors.white),)))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Liyakath')),
                      DataCell(Container( height: 60,
                          width: 130,
                          color: Colors.red[900],
                          child: Center(child: Text('Lost',style: TextStyle(color: Colors.white),)))),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        30.00,
                      ),
                      top: getVerticalSize(
                        40.00,
                      ),
                      right: getHorizontalSize(
                        30.00,
                      ),
                      bottom: getVerticalSize(
                        20.00,
                      ),
                    ),
                    child: GestureDetector(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyMatches(fragmentToShow: 0,)),
                      );
                    },
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          45.00,
                        ),
                        width: getHorizontalSize(
                          300.00,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.green6320,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              10.00,
                            ),
                          ),
                        ),
                        child: Text(
                          "Send to all",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}