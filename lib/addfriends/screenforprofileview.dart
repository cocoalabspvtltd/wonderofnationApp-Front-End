
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class Profileview extends StatefulWidget {
  const Profileview({Key? key}) : super(key: key);

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  @override
  var buttonText = 'Follow';

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        leading: Center(child: Text("X",style: TextStyle(color: Colors.black),)),
        title: Padding(padding:EdgeInsets.only(left: 297),
            child: Image.asset("assets/images/menudots.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Center(child: Padding(
             padding: const EdgeInsets.only(top: 28.0),
             child: Image.asset("assets/images/profileimage.png"),
           ),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text("UserName",style: TextStyle(fontWeight: FontWeight.bold),),
            )
            ,
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Text("Professional Tennis Player",style: TextStyle(),),
            )
            ,
            Container(
              width: getHorizontalSize(
                311.00,
              ),
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  10.00,
                ),
                top: getVerticalSize(
                  7.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum, accumsan, felis fermentum dui diam ",
                maxLines: null,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.black900,
                  fontSize: getFontSize(
                    10,
                  ),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    28.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        53.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          59.00,
                        ),
                      ),
                      child: Text(
                        "70\nMatches",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        59.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          39.00,
                        ),
                      ),
                      child: Text(
                        "8000\nFollowers",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        58.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          39.00,
                        ),
                        right: getHorizontalSize(
                          53.00,
                        ),
                      ),
                      child: Text(
                        "400\nFollowing",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  10.00,
                ),
                top: getVerticalSize(
                  37.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
                bottom: getVerticalSize(
                  20.00,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: getVerticalSize(
                  37.00,
                ),
                width: size.width,
                decoration: BoxDecoration(
                  color: ColorConstant.orange900,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      18.50,
                    ),
                  ),
                ),
                child: GestureDetector(onTap: () {
                  setState(() {
                    buttonText = 'Unfollow';

                  });
                },
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.whiteA700,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.36,
                    ),
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
