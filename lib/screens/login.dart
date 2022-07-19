
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/screens/googlesignin.dart';

import 'package:http/http.dart' as http;



import '../apis/repositories/registerRepositories.dart';
import '../constants/app_textbox.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../forgotpassword/forgotpasswordscreen.dart';
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

  bool _validate = false;
  bool _validatePassword = false;
  bool _isobsucure = true;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  drLOginRepository loginApiCall = new drLOginRepository();
  TextEditingController EmailLoginController = TextEditingController();
  String _email = "";
  String _pass = "";
  Future login() async {
    Map data = {
      'name': emailController.text,
      'password': passwordController.text,

    };
    print(data);
    print("---body-->>>${data}");
    var response = await http.post(
      Uri.parse('https://1526-59-98-51-243.ngrok.io/api/login'),
      body:data,
      headers: {
        "accept": "application/json",
      },
    );

    Map EditResponse = json.decode(response.body);
    print("resoo000>>>>>>${EditResponse}");

    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage(user3: name,)),
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

  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return  Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: size.width,


                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
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
                                              color: Colors.black,
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
                                      60.00,
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

                                  TextFormField(
                                    controller: EmailLoginController,
                                    decoration: InputDecoration(


                                      contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 17),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Enter your emailId",
                                      hintStyle: TextStyle(fontSize: 10,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      errorText: _validatePassword ? 'Please fill this field' : null,
                                    ),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "* Required";
                                      } else
                                        return null;
                                    },
                                    onSaved: (value) => emailController.text = value!,
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
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        //contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.0)),
                                        hintText: "Enter Your Password",
                                        hintStyle: TextStyle(fontSize: 10,),
                                        errorText:
                                        _validatePassword ? 'Please fill this field' : null,
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              _isobsucure ? Icons.visibility : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isobsucure = !_isobsucure;
                                              });
                                            })
                                    ),
                                    obscureText: _isobsucure,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "* Required";
                                      } else
                                        return null;
                                    },
                                    onSaved: (value) => passwordController.text = value!,
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
                                  child: GestureDetector(onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()),
                                    );
                                  },
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
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Form(key: _formKey,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        0.00,
                                      ),
                                      top: getVerticalSize(
                                        26.00,
                                      ),
                                      right: getHorizontalSize(
                                        0.00,
                                      ),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_formKey.currentState!.validate()) {
                                            print("Form was Submitted Successfully");
                                            passwordController.text.isEmpty
                                                ? _validate = true
                                                : _validate = false;
                                            passwordController.text.isEmpty
                                                ? _validatePassword = true
                                                : _validatePassword = false;
                                          }
                                          loginApiCall.createUser(EmailLoginController.text,
                                              passwordController.text, context);
                                        });
                                      },
                                      child: Container(color: ColorConstant.orange900,height: 40,width: 360,
                                        child: Center(
                                          child: Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                fontSize: 15,
                                                //fontWeight: FontWeight.bold,
                                                color: Colors.white),
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
