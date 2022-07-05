
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/screens/googlesignin.dart';

import 'package:http/http.dart' as http;

import '../constants/app_textbox.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../homePage/homepage1.dart';
import '../homePage/navigator.dart';
import '../homePage/register.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool _passwordVisible = false;

  void initState() {
    _passwordVisible = false;

  }
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email = "";
  String _pass = "";
  Future login(String email,pass,context) async {
    Map data = {
      'name': email,
      'password': pass,

    };
    print(data);
    print("---body-->>>${data}");
    var response = await http.post(
      Uri.parse('https://68ea-59-98-48-61.ngrok.io/api/login'),
      body:data,
      headers: {
        "accept": "application/json",
      },
    );

    Map EditResponse = json.decode(response.body);
    print("resoo000>>>>>>${EditResponse}");
    username = EditResponse["user"]["name"];
    print("username>>>>>>${username}");
    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
      print('success');

    } else {
      Fluttertoast.showToast(
        msg: "Username or password is not registerd",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      print('error');
    }
  }
  // _showSnackbar() {
  //   var snackBar = new SnackBar(content: Text("Login Successful"));
  //
  //   scaffoldKey.currentState?.showSnackBar(snackBar);
  // }

  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return  Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.indigo900,
          body: SingleChildScrollView(
            child: Container(
              width: size.width,


                child: Container(

                  decoration: BoxDecoration(
                    color: ColorConstant.indigo900,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              268.00,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      20.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/images/img_rectangle180.png",
                                    height: getVerticalSize(
                                      113.00,
                                    ),
                                    width: getHorizontalSize(
                                      154.00,
                                    ),

                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            99.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Login",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.orange900,
                                            fontSize: getFontSize(
                                              18,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            44.00,
                                          ),
                                          right: getHorizontalSize(
                                            99.00,
                                          ),
                                        ),
                                        child: GestureDetector(onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  RegisterScreen()),
                                          );
                                        },
                                          child: Text(
                                            "Register",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: ColorConstant.whiteA700,
                                              fontSize: getFontSize(
                                                18,
                                              ),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      25.00,
                                    ),
                                    top: getVerticalSize(
                                      30.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Text(
                                    "User Id",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        12,
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
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    40.00,
                                  ),
                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:

                                  TextFormField(style: TextStyle(color: ColorConstant.gray400,fontSize: 15),
                                    validator: (val) => !val!.contains("@") ? "Email Id is not Valid" : null ,
                                    onSaved: (val) => _email = val!,
                                    decoration: InputDecoration( contentPadding: EdgeInsets.all(7.0),
                                      hintStyle: TextStyle(
                                          color: ColorConstant.gray400,fontSize: 12
                                      ),
                                      hintText: "Enter Your mail Id",

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
                                      prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,)
                                    ),
                                  ),

                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
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
                                  child: Text(
                                    "Password",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        12,
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
                                    14.00,
                                  ),
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    40.00,
                                  ),
                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:

                                  TextFormField(
                                    style: TextStyle(color: ColorConstant.gray400,fontSize: 15),
                                    obscureText: _passwordVisible,

                                    onSaved: (val) => _pass = val!,
                                    validator: (val) => val!.length < 8  ? "Password length should be Greater than 6" : null ,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(7.0),
                                      hintStyle: TextStyle(
                                          color: ColorConstant.gray400,fontSize: 12
                                      ),
                                      hintText: "Enter your Password",

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
                                      suffixIcon: IconButton(
                                          icon: Icon(_passwordVisible ? Icons.visibility:Icons.visibility_off,color: Colors.white,size: 14,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible = !_passwordVisible;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      20.00,
                                    ),
                                    top: getVerticalSize(
                                      15.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Forgot Password?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.orange900,
                                      fontSize: getFontSize(
                                        10,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Form(key: _formKey,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        20.00,
                                      ),
                                      top: getVerticalSize(
                                        26.00,
                                      ),
                                      right: getHorizontalSize(
                                        20.00,
                                      ),
                                    ),
                                    child: GestureDetector(onTap: () {
                                      login(emailController.text, passwordController.text, context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  DashBoard()),
                                      );
                                      // setState(() {
                                      //   print("-->>>>Form was Submitted Successfully");
                                      //   if (_formKey.currentState!.validate()) {
                                      //     print("Form was Submitted Successfully");
                                      //     NameController.text.isEmpty ? _validate = true : _validate = false;
                                      //     print("Form was Submitted Successfully");
                                      //     EmailControler.text.isEmpty
                                      //         ? _validatePassword = true
                                      //         : _validatePassword = false;
                                      //   }
                                      //
                                      // });
                                      //
                                      // if (formKey.currentState!.validate()) {
                                      //   formKey.currentState!.save();
                                      //
                                      //   _showSnackbar();
                                      // }

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
                                          "Login",
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
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(onTap: (){
                                  print("g");
                                },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        20.00,
                                      ),
                                      top: getVerticalSize(
                                        43.00,
                                      ),
                                      right: getHorizontalSize(
                                        20.00,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.indigo900,
                                      border: Border.all(
                                        color: ColorConstant.gray500,
                                        width: getHorizontalSize(
                                          1.00,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              19.00,
                                            ),
                                            top: getVerticalSize(
                                              14.00,
                                            ),
                                            bottom: getVerticalSize(
                                              14.00,
                                            ),
                                          ),
                                          child: GestureDetector(onTap: (){

                                          },
                                            child: Text(
                                              "Or Continue with",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: ColorConstant.whiteA700,
                                                fontSize: getFontSize(
                                                  12,
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
                                              17.00,
                                            ),
                                            top: getVerticalSize(
                                              3.00,
                                            ),
                                            right: getHorizontalSize(
                                              22.00,
                                            ),
                                            bottom: getVerticalSize(
                                              5.00,
                                            ),
                                          ),
                                          child: GestureDetector(onTap: (){
                                            print("b");
                                          },
                                            child: Container(
                                              height: getSize(
                                                35.00,
                                              ),
                                              width: getSize(
                                                35.00,
                                              ),
                                              child: Image.asset("assets/images/google-logo.png"),

                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

            ),
          ),
        ),
      ),
    );
  }



}
