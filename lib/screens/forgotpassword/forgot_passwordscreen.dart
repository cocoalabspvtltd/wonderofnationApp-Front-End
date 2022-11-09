
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/register_game.dart';
import 'package:oo/screens/forgotpassword/reset_password.dart';

import '../../apis/repositories/edit_profile.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';



class ForgotPasswordScreen extends StatelessWidget {
  ForgotPassword forgotpassword = ForgotPassword();
  TextEditingController ChangePasswordContraoller = TextEditingController();
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
                        150.00,
                      ),
                      right: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    child: Text(
                      "Forgot Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        308.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          31.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: Text(
                        "Send a OTP to your registered mobile number to reset your password",
                        maxLines: null,
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
                  ),
                  Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: getHorizontalSize(
                      320.01,
                    ),
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        20.00,
                      ),
                      top: getVerticalSize(
                        22.00,
                      ),
                      right: getHorizontalSize(
                        19.99,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        23.00,
                      ),
                      top: getVerticalSize(
                        16.00,
                      ),
                      right: getHorizontalSize(
                        23.00,
                      ),
                    ),
                    child: Text(
                      "E-mail Id or Mobile No.",
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
                        17.00,
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
                        controller: ChangePasswordContraoller,
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
                            right: getHorizontalSize(
                              30.00,
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
                          39.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: GestureDetector(onTap: ()async{
                        await forgotpassword.forgotpassword(ChangePasswordContraoller.text,context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) =>    Resetpassword()),
                      //   );
                      },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            42.00,
                          ),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.green[900],
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Change Password",
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
