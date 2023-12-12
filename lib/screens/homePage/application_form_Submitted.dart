
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';

import 'navigator.dart';


class Won1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(backgroundColor: Colors.white,
          elevation: 0,

          leading: Icon(Icons.arrow_back_outlined,color: Colors.black,),
        ),
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          116.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/submitted.png",
                        height: getVerticalSize(
                          208.00,
                        ),
                        width: getHorizontalSize(
                          277.00,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        251.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          24.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: Text(
                        "Application Successfully \nSubmitted",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            20,
                          ),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.00,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          33.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
                        );
                      },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            42.00,
                          ),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.orange900,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                10.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Okay",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.70,
                              height: 1.29,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}