import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:oo/screens/login.dart';

import 'constants/colors.dart';
import 'constants/mathutils.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    104.00,
                  ),
                  bottom: getVerticalSize(
                    20.00,
                  ),
                ),
                child: Image.asset(
                  "assets/images/img_rectangle180.png",
                  height: getVerticalSize(
                    419.00,
                  ),
                  width: getHorizontalSize(
                    360.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    40.00,
                  ),
                  top: getVerticalSize(
                    40.00,
                  ),
                  right: getHorizontalSize(
                    40.00,
                  ),
                  bottom: getVerticalSize(
                    40.00,
                  ),
                ),
                child: Text(
                  "Wonder of nation",


                  style: TextStyle(
                    color: ColorConstant.whiteA700,
                    fontSize: getFontSize(
                      24,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:ImageSlideshow(
        width: double.infinity,
        height: height,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/splash6.jpg',
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.transparent,),
                      margin: EdgeInsets.only(top: 400,left: 30),
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor /nsit amet',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      )),
                ),
                Center(
                  child: GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                    child: Container(height: 40,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.deepOrange,),
                        margin: EdgeInsets.only(top: 600,),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/spash5.jpg',
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.transparent,),
                      margin: EdgeInsets.only(top: 400,left: 30),
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor /nsit amet',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      )),
                ),
                Center(
                  child: GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                    child: Container(height: 40,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.deepOrange,),
                        margin: EdgeInsets.only(top: 600,),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/splash4.jpg',
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.transparent,),
                      margin: EdgeInsets.only(top: 400,left: 30),
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor /nsit amet',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      )),
                ),
                Center(
                  child: GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                    child: Container(height: 40,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.transparent,),
                        margin: EdgeInsets.only(top: 600,),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
