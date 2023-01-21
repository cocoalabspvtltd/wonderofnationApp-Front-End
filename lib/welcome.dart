import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/screens/homePage/navigator.dart';

import 'package:oo/screens/login.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import 'constants/sharedpref.dart';


class WelcomeScreen extends StatefulWidget {
  final bool isFromLogout;

  const WelcomeScreen({Key? key, this.isFromLogout = false}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
     // setScreenDimensions(context);

      setState(() {});

      if (UserDetails.apiToken.isEmpty) await SharedPrefs.init();
      await SharedPrefs.init();

      Future.delayed(Duration(milliseconds: 1400), () {
        if (UserDetails.apiToken != '') {


            return Get.offAll(() => DashBoard(UserName1: UserDetails.userName));

        } else {
          return Get.offAll(() => LoginScreen());
        }
      });
    });
    Timer(
        Duration(seconds:4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
            padding: const EdgeInsets.only(left: 50),
            child: PlayAnimation<double>(
              tween: Tween(begin: -60, end:screenHeight * 0.07), // value for offset x-coordinate
              duration:Duration(milliseconds:800),
              builder: (context, child, value) {
                return Transform.translate(
                  offset: Offset(0, value), // use animated value for x-coordinate
                  child: child,
                );
              },// non-linear animation
              child: Column(
                children: [
                  Container(
                      width: screenWidth *0.7,
                      height: screenHeight * 0.8,
                      alignment: Alignment.center,
                      child:Image.asset("assets/images/GOLD WON.png")),
                  Column(
                    children: [
                      Text(
                        'Powered by',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Binary Sequence',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FutureBuilder<String>(
                          future: _getAppVersion(),
                          builder:
                              (BuildContext context, AsyncSnapshot<String> snapshot) {
                            String version = '';
                            if (snapshot.connectionState == ConnectionState.done &&
                                snapshot.hasData)
                              version = snapshot.data == null
                                  ? ''
                                  : 'Version : ${snapshot.data}';
                            return Text(
                              '$version',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.white),
                            );
                          }),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ],
              ),

            ),
          ),

        ),
      );


  }
  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}

class SecondScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                    fontSize: 13,fontWeight: FontWeight.bold),)),
              ),
              Positioned(
                top: screenHeight * 0.67,
                left: screenWidth * 0.3,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: screenHeight * 0.72,
                left: screenWidth * 0.23,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: screenHeight * 0.24,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white,width:0.5)
                      ),
                      margin: EdgeInsets.only(
                        top: 500,
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
                top: screenHeight * 0.67,
                left:screenWidth * 0.3,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: screenHeight * 0.72,
                left: screenWidth * 0.23,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: screenHeight * 0.24,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white,width:0.5)
                      ),
                      margin: EdgeInsets.only(
                        top: 500,
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
                top: screenHeight * 0.67,
                left: screenWidth * 0.3,
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0, fontFamily: 'Inter'),
                ),
              ),
              Positioned(
                top: screenHeight * 0.72,
                left:screenWidth * 0.23,
                child: Text("Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit.\nDiam in quam aliquam fames tellus a facilisi vivamus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0),),
              ),
              Positioned(
                top: screenHeight * 0.24,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Center(
                    child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white,width:0.5)
                        ),
                        margin: EdgeInsets.only(
                          top: 500,
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