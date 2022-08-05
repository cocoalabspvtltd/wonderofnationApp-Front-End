import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oo/homePage/registerprofile.dart';

import '../apis/repositories/registerRepositories.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../dropdowns/game_list_register.dart';
import '../dropdowns/gamesdropdown.dart';
import 'levelling2.dart';

var answers1;
var answers2;
var answers3;

class Levelingfirst extends StatefulWidget {
  const Levelingfirst(
    int designatioids, {
    Key? key,
    required this.user1,
  }) : super(key: key);
  final String user1;

  @override
  State<Levelingfirst> createState() => _LevelingfirstState();
}

class _LevelingfirstState extends State<Levelingfirst> {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterProfile(
                            names: name,
                          )));
            }),
        title: Padding(
          padding: const EdgeInsets.only(left: 70, right: 50),
          child: Text(
            "Leveling",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80, left: 10),
                child: Text(
                  "1. At what level do you think you are?",
                  style: TextStyle(
                    color: ColorConstant.green6320,
                    fontSize: getFontSize(
                      17,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '1',
                    groupValue: answers1,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers1 = value;
                        print("answers1--->${value}");
                      });
                    },
                  ),
                  title: Text("Beginner"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '2',
                    groupValue: answers1,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers1 = value;
                        print("answers1--->${value}");
                      });
                    },
                  ),
                  title: Text("Intermediate"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '3',
                    groupValue: answers1,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers1 = value;
                        print("answers1--->${value}");
                      });
                    },
                  ),
                  title: Text("Advanced"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '4',
                    groupValue: answers1,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers1 = value;
                        print("answers1--->${value}");
                      });
                    },
                  ),
                  title: Text("Competition"),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 15),
                child: Text(
                  "2. What is the highest level you have played yet?",
                  style: TextStyle(
                    color: ColorConstant.green6320,
                    fontSize: getFontSize(
                      17,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '1',
                    groupValue: answers2,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers2 = value;
                      });
                    },
                  ),
                  title: Text("National"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '2',
                    groupValue: answers2,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers2 = value;
                      });
                    },
                  ),
                  title: Text("State"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '3',
                    groupValue: answers2,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers2 = value;
                      });
                    },
                  ),
                  title: Text("Club"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '4',
                    groupValue: answers2,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers2 = value;
                      });
                    },
                  ),
                  title: Text("I don't compete"),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 10),
                child: Text(
                  "3. How long have you been playing regulary?",
                  style: TextStyle(
                    color: ColorConstant.green6320,
                    fontSize: getFontSize(
                      17,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '1',
                    groupValue: answers3,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers3 = value;
                      });
                    },
                  ),
                  title: Text("0-1"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '2',
                    groupValue: answers3,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers3 = value;
                      });
                    },
                  ),
                  title: Text("1-2"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '3',
                    groupValue: answers3,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers3 = value;
                      });
                    },
                  ),
                  title: Text("2-5"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '5',
                    groupValue: answers3,
                    activeColor: ColorConstant.green6320,
                    onChanged: (Object? value) {
                      setState(() {
                        answers3 = value;
                      });
                    },
                  ),
                  title: Text("Above 5 years"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    20.00,
                  ),
                  top: getVerticalSize(
                    66.00,
                  ),
                  right: getHorizontalSize(
                    20.00,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Levelingsecond(
                                  designatioids1,
                                  username: widget.user1,
                                )));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      42.00,
                    ),
                    width: getHorizontalSize(
                      320.00,
                    ),

                    decoration: BoxDecoration(
                      color: ColorConstant.green6320,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "Continue",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
