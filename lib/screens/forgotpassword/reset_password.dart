
import 'package:flutter/material.dart';


import '../../constants/colors.dart';
import '../../constants/math_utils.dart';



class Resetpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
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
                          12.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: Image.asset(
                      "assets/images/icon.png",
                        height: getVerticalSize(
                          113.00,
                        ),
                        width: getHorizontalSize(
                          154.00,
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        126.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: Text(
                      "Reset Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.orange900,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        34.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: Text(
                      "New Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        14.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        320.00,
                      ),
                      child: TextFormField(
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          hintText: 'Enter your mail id',
                          hintStyle: TextStyle(
                            fontSize: getFontSize(
                              12.0,
                            ),
                            color: ColorConstant.gray400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                30.00,
                              ),
                              top: getVerticalSize(
                                14.88,
                              ),
                              right: getHorizontalSize(
                                18.00,
                              ),
                              bottom: getVerticalSize(
                                15.87,
                              ),
                            ),
                            child: Container(
                              height: getSize(
                                8.25,
                              ),
                              width: getSize(
                                12.00,
                              ),
                              child:Icon(Icons.visibility,

                              ),
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: getSize(
                              8.25,
                            ),
                            minHeight: getSize(
                              8.25,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                            left: getHorizontalSize(
                              18.00,
                            ),
                            top: getVerticalSize(
                              12.00,
                            ),
                            bottom: getVerticalSize(
                              12.00,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray400,
                          fontSize: getFontSize(
                            12.0,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                    child: Text(
                      "Confirm Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        14.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        320.00,
                      ),
                      child: TextFormField(
                        focusNode: FocusNode(),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            fontSize: getFontSize(
                              12.0,
                            ),
                            color: ColorConstant.gray400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            borderSide: BorderSide(
                              color: ColorConstant.bluegray100,
                              width: 1,
                            ),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                30.00,
                              ),
                              top: getVerticalSize(
                                14.88,
                              ),
                              right: getHorizontalSize(
                                18.00,
                              ),
                              bottom: getVerticalSize(
                                15.87,
                              ),
                            ),
                            child: Container(
                              height: getSize(
                                8.25,
                              ),
                              width: getSize(
                                12.00,
                              ),
                        child:Icon(Icons.visibility,

                            ),
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: getSize(
                              8.25,
                            ),
                            minHeight: getSize(
                              8.25,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                            left: getHorizontalSize(
                              18.00,
                            ),
                            top: getVerticalSize(
                              12.00,
                            ),
                            bottom: getVerticalSize(
                              12.00,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray400,
                          fontSize: getFontSize(
                            12.0,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
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
                          43.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
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
                              5.00,
                            ),
                          ),
                        ),
                        child: Text(
                          "Save New Password",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
