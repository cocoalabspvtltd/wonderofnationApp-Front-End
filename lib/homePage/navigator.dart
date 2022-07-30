import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';

import 'navigatoritem.dart';




class DashBoard extends StatefulWidget {
  const DashBoard({Key? key, required this.UserName1,}) : super(key: key);
final String UserName1;
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body:
      navigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(


        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(15),
            // topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,

            onTap: (index) async {

              if (index == 0)
              { Icons.home;

              print("hellooooooooo");
              setState(()   {

                currentIndex = index;

              });

              }
              if (index == 1)
              {

                setState(()  {

                  currentIndex = index;


                });

              }
              if (index == 2)
              {

                setState(()   {

                  currentIndex = index;

                });

              }
              if (index == 3)
              {
                setState(()  {

                  currentIndex = index;
                  print("index==${index}");

                });

              }



            },

            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorConstant.green6320,

            selectedIconTheme: IconThemeData(
              color: ColorConstant.green6320,
            ),
            unselectedIconTheme: IconThemeData(
              color:Colors.black,

            ),
            iconSize: 29
            ,

            // selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            //unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: navigatorItems.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index,icon: e.ICON);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {required String label,  required int index,required icon}) {
    Color iconColor =
    index == currentIndex ? Colors.black : Colors.black;

    return
      BottomNavigationBarItem(
          label: label,
          icon: icon
      );
  }
}