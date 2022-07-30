
import 'package:flutter/material.dart';
import 'package:oo/homePage/navigator.dart';


import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import 'applicationform.dart';

class WonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashBoard(UserName1: '',)),
            );
          }, icon: Icon(Icons.arrow_back_outlined,color: Colors.black,)),
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        24.00,
                      ),
                      top: getVerticalSize(
                        10.00,
                      ),
                      right: getHorizontalSize(
                        24.00,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        14.00,
                      ),
                      width: getHorizontalSize(
                        16.00,
                      ),
                      // child: Image.asset(
                      //  "assets/images/academy.png",
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      206.00,
                    ),
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        30.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Wonder of Nation \n',
                            style: TextStyle(
                              color: ColorConstant.green6320,
                              fontSize: getFontSize(
                                24,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.04,
                            ),
                          ),
                          TextSpan(
                            text: 'Sports Academy ',
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                20,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
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
                          20.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            8.00,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/academy.png",
                          height: getVerticalSize(
                            173.00,
                          ),
                          width: getHorizontalSize(
                            320.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        200.00,
                      ),
                      width: getHorizontalSize(
                        320.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          23.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  105.00,
                                ),
                                top: getVerticalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  105.00,
                                ),
                                bottom: getVerticalSize(
                                  5.00,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                320.00,
                              ),
                              child: Text(
                                "The WON Multi-sport Academy is a world class project intended to nurture and support the younger  generation  with their  passion in sports. Our aim is to facilitate international training for kids in various type of sports and to bring out the best of their latent talent inherent in them.  We will  have full fledge schools for all age  groups, additionally we will have graduation and  post-graduation courses  to\rhelp the candidate  to utilize  their full potential.  We also have   sport \rresearch center, premium hotels and state of the art hospital facilities.",
                                maxLines: null,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.60,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          50.00,
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
                          MaterialPageRoute(builder: (context) =>  ApplicationFormScreen()),
                        );
                      },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            42.00,
                          ),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.green6320,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Book Your Seat Now",
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