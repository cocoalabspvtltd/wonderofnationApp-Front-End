import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:oo/screens/login.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return
      Container(
        decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg",
              ),
              fit: BoxFit.fill,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: PlayAnimation<double>(
              tween: Tween(begin: 80.0, end:210.0), // value for offset x-coordinate
              duration:Duration(milliseconds:800),
              builder: (context, child, value) {
                return Transform.translate(
                  offset: Offset(0, value), // use animated value for x-coordinate
                  child: child,
                );
              },// non-linear animation
              child: Container(
                  width: 280,
                  height: 280,
                  alignment: Alignment.center,
                  child:Image.asset("assets/images/GOLD WON.png")),
            ),
          ),

        ),
      );

  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageSlideshow(
        width: double.infinity,
        height: double.infinity,
        initialPage: 0,
        indicatorColor: Colors.white,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/splash1.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 37,
                right: 20,
                child: TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }, child: Text("Skip",style: TextStyle(color: Colors.white,fontFamily: 'Inter',
                    fontSize: 13),)),
              ),
              Positioned(
                top: 500.0,
                left: 80,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: 530.0,
                left: 50,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: 80,
                left: 0,
                right:0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white,width:0.5)
                      ),
                      margin: EdgeInsets.only(
                        top: 570,
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Image.asset(
                "assets/images/splash2.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 37,
                right: 20,
                child: TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }, child: Text("Skip",style: TextStyle(color: Colors.white,fontFamily: 'Inter',
                    fontSize: 13),)),
              ),
              Positioned(
                top: 500.0,
                left: 80,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: 530.0,
                left: 50,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white,width:0.5)
                      ),
                      margin: EdgeInsets.only(
                        top: 570,
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Image.asset(
                "assets/images/splash3.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 37,
                right: 20,
                child: TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }, child: Text("Skip",style: TextStyle(color: Colors.white,fontFamily: 'Inter',
                    fontSize: 13),)),
              ),
              Positioned(
                top: 500.0,
                left: 80,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: 530.0,
                left: 50,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width-20,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white,width:0.5)
                        ),
                        margin: EdgeInsets.only(
                          top: 570,
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}