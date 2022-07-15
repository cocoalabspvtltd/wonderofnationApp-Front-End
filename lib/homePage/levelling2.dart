import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oo/homePage/navigator.dart';
import '../apis/repositories/levellingregister.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
var answers4;
var answers5;
class Levelingsecond extends StatefulWidget {
  const Levelingsecond(int designatioids, {Key? key, }) : super(key: key);

  @override
  State<Levelingsecond> createState() => _LevelingsecondState();
}

class _LevelingsecondState extends State<Levelingsecond> {
  @override
  LevellingRegisterRepository  LevellingRedisteapi  = LevellingRegisterRepository();
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70,right: 50),
          child: Text("Leveling",style: TextStyle(color: Colors.black,fontSize: 18),),
        ),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:10,right: 200),
                child: Text("4. How old are you?",style: TextStyle(color: ColorConstant.orange900,
                  fontSize: getFontSize(
                    17,
                  ),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '1', groupValue: answers4, onChanged: (Object? value) {
                    setState(() {
                      answers4=value;
                    });},),
                  title: Text("18-30"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '2', groupValue: answers4, onChanged: (Object? value) {
                    setState(() {
                      answers4=value;
                    });},),
                  title: Text("3"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '3', groupValue: answers4, onChanged: (Object? value) {
                    setState(() {
                      answers4=value;
                    });},),
                  title: Text("40-50"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '4', groupValue: answers4, onChanged: (Object? value) {
                    setState(() {
                      answers4=value;
                    });},),
                  title: Text("Over 50"),
                ),
              ),
              SizedBox(height: 45,),
              Padding(
                padding: const EdgeInsets.only(right:150,left: 10),
                child: Text("5. What's your fitness level?",style: TextStyle(color: ColorConstant.orange900,
                  fontSize: getFontSize(
                    17,
                  ),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '1', groupValue: answers5, onChanged: (Object? value) {
                    setState(() {
                      answers5=value;
                    });},),
                  title: Text("Excellent"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '2', groupValue: answers5, onChanged: (Object? value) {
                    setState(() {
                      answers5=value;
                    });},),
                  title: Text("Good"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '3', groupValue: answers5, onChanged: (Object? value) {
                    setState(() {
                      answers5=value;
                    });},),
                  title: Text("Normal"),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Radio(
                    value: '4', groupValue: answers5, onChanged: (Object? value) {
                    setState(() {
                      answers5=value;
                    });},),
                  title: Text("Low"),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    20.00,
                  ),
                  top: getVerticalSize(
                    36.00,
                  ),
                  right: getHorizontalSize(
                    20.00,
                  ),
                ),
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Levelingfirst()));
                    _showDialog(context);
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
                      color: ColorConstant.orange900,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "Confirm & Register",
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
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor: Color(0xffD0CEF5),
          insetPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0,),
          elevation: 0.0,
          title: Column(
              children:[
                Image.asset("assets/images/play-2.png", fit: BoxFit.fitHeight,),
                SizedBox(height: 5,),
                Text("You are ready to play",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                SizedBox(height: 3,),
                Text("You can start playing matches in wonder of nation",
                  style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400),),
              ]
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                  LevellingRedisteapi.getLevel1port(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    40.00,
                  ),
                  width: getHorizontalSize(
                    240.00,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.orange900,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
                  ),
                  child: Text(
                    "Start Playing",
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
            SizedBox(height: 60,),
          ],
        );
        // AlertDialog(
        //    content: Stack(
        //      alignment: Alignment.centerLeft,
        //      children: <Widget>[
        //        Image.asset("assets/images/play.png"
        //        ),
        //        Text(
        //          'Add Your Text Here',
        //          style: TextStyle(
        //            fontSize: 24,
        //          ),
        //        ),
        //      ],
        //    ),
        // );
      },
    );
  }
}