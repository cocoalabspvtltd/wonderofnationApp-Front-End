import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:oo/apis/bloc/authbloc.dart';
import 'package:oo/apis/modelclass/userloginresponse.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/screens/homePage/register_profile.dart';


import '../../apis/repositories/register_Repositories.dart';
import '../../constants/base_urls.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/sharedpref.dart';
import '../../utilities/appdialgs.dart';
import '../login.dart';


TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmpassController = TextEditingController();
String username = "";
//String Token1 = "";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // drLOginRepository registerapi = drLOginRepository();
  late Map EditResponse;
  bool _validate = false;
  AuthBlocUser _authBloc = AuthBlocUser();
  void initState() {

    setState(() { confirmpassController.clear();  passwordController.text= "";});

  }
  // Future register(String name, email, mobile, pass, conpass, context) async {
  //   EasyLoading.show(status: 'loading...');
  //   Map data = {
  //     'name': name,
  //     'email': email,
  //     'phone': mobile,
  //     'password': pass,
  //     'password_confirmation': conpass,
  //   };
  //   print(data);
  //   print("---body-->>>${data}");
  //   var response = await http.post(
  //     Uri.parse('${baseurl}create'),
  //     body: data,
  //     headers: {
  //       "accept": "application/json",
  //     },
  //   );
  //   EasyLoading.dismiss();
  //
  //   EditResponse = json.decode(response.body);
  //   print("resoo000>>>>>>${EditResponse}");
  //   name = EditResponse["user"]["name"];
  //
  //   print("username>>>>>>${name}");
  //   print(response.statusCode);
  //
  //   if (response.statusCode == 200) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => RegisterProfile(names: name,)),
  //     );
  //     print('success');
  //
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "The given data was invalid",
  //       gravity: ToastGravity.BOTTOM,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //     print('error');
  //   }
  // }
  Future _signUp(
      String email,
      String name,
      String phone,
      String password,
      ) async {
    AppDialogs.loading();

    Map<String, dynamic> body = {};
    body["name"] = name;
    body["email"] = email;
    body["phone"] = phone;
    body["password"] = password;
    body["password_confirmation"] = password;


    try {
      UserSignInModel response =
      await _authBloc!.userRegistration(json.encode(body));
      Get.back();
      if (response.success!) {
        await SharedPrefs.logIn(response);

          Get.offAll(() => RegisterProfile(names: UserDetails.userName,));

        }
       else {
        Fluttertoast.showToast(msg:'${response.message!}');
      }
    } catch (e, s) {
      Completer().completeError(e, s);
      Get.back();
      Fluttertoast.showToast(msg:'Something went wrong. Please try again');
    }
  }
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }

  bool _validatePassword = false;
  bool _isobsucure = true;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
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
                              12.00,
                            ),
                            bottom: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    20.00,
                                  ),
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                  top: 10
                                ),
                                child: Image.asset(
                                  "assets/images/GOLD WON.png",
                                  height: getVerticalSize(
                                    83.00,
                                  ),
                                  width: getHorizontalSize(
                                    154.00,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      40.00,
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
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()),
                                            );
                                          },
                                          child: Text(
                                            "Login",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                18,
                                              ),
                                              fontFamily: 'Inter', fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            80.00,
                                          ),
                                          right: getHorizontalSize(
                                            76.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Register",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.green6320,
                                            fontSize: getFontSize(
                                              18,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
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
                                      39.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Text(
                                    "User Name",
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

                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:   Padding(
                                    padding: const EdgeInsets.only(bottom: 15,),
                                    child: TextFormField(controller: usernameController,
                                      keyboardType: TextInputType.name,
                                      decoration:InputDecoration(hintText: "UserName",contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '*Required';
                                        }
                                        return null;
                                      },
                                      onSaved: (String? value){
                                        UserDetails.userMobile = value!;
                                      },
                                    ),
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
                                      20.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Email Id",
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

                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(bottom: 15,),
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.text,
                                      decoration:InputDecoration(hintText: "Email", contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                                      validator: (String? value){
                                        if(value!.isEmpty)
                                        {
                                          return 'Please a Enter';
                                        }
                                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                          return 'Please a valid Email';
                                        }
                                        return null;
                                      },
                                      onSaved: (String? value){
                                        UserDetails.userEmail = value!;
                                      },
                                    ),
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
                                      21.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Mobile No.",
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

                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(bottom: 15,),
                                    child: TextFormField(controller:mobileController,
                                      keyboardType: TextInputType.number,
                                      decoration:InputDecoration(hintText: "Phone No",contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                                      validator: (value) {
                                        if (value?.length != 10)
                                          return 'Mobile Number must be of 10 digit';
                                        else
                                          return null;
                                      },
                                      onSaved: (String? value){
                                        UserDetails.userMobile = value!;
                                      },
                                    ),
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
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
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
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      5.00,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.whiteA700,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getHorizontalSize(
                                        320.00,
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 15,),
                                          child: TextFormField(
                                            controller: passwordController,
                                            keyboardType: TextInputType.text,
                                            decoration:InputDecoration(hintText: "Password",         contentPadding:
                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                                            validator: (value){
                                              if(value!.isEmpty){
                                                return "Please enter password";
                                              }else{
                                                //call function to check password
                                                bool result = validatePassword(value);
                                                if(result){
                                                  // create account event
                                                  return null;
                                                }else{
                                                  return " Password should contain Capital, small letter & Number & Special";
                                                }
                                              }
                                            },
                                            onSaved: (String? value){
                                            //  pass = value!;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child: Container(
                                    child:Padding(
                                      padding: const EdgeInsets.only(bottom: 15,),
                                      child: TextFormField(
                                        controller: confirmpassController,
                                        obscureText: true,
                                        keyboardType: TextInputType.text,
                                        decoration:InputDecoration(hintText: "Confirm Password",
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                        ),
                                        validator: (String? value){
                                          if(value!.isEmpty)
                                          {
                                            return 'Please re-enter password';
                                          }
                                          print(passwordController.text);
                                          print(confirmpassController.text);
                                          if(passwordController.text!=confirmpassController.text){
                                            return "Password does not match";
                                          }
                                          return null;
                                        },
                                      ),
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
                                    45.00,
                                  ),
                                  right: getHorizontalSize(
                                    20.00,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () async{
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

                                    });
                                    await  _signUp(
                                        emailController.text,
                                        usernameController.text,

                                        mobileController.text,
                                        passwordController.text,
                                    );

                                    usernameController.clear();
                                    emailController.clear();
                                    mobileController.clear();
                                    passwordController.clear();
                                    confirmpassController.clear();

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
                                      color: ColorConstant.green6320,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          5.00,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Continue",
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      26.00,
                                    ),
                                    top: getVerticalSize(
                                      8.00,
                                    ),
                                    right: getHorizontalSize(
                                      14.00,
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'By registering you are accepting our ',
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              12,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'terms of use',
                                          style: TextStyle(
                                            color: ColorConstant.green6320,
                                            fontSize: getFontSize(
                                              12,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' and ',
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              12,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'privacy policy',
                                          style: TextStyle(
                                            color: ColorConstant.green6320,
                                            fontSize: getFontSize(
                                              12,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.33,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
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

  Widget _createTextFormField(TextEditingController controller, String hintText,
      bool obscureText, TextInputType inputType, ) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
          fontSize: 10.0,
        ),
      decoration: InputDecoration(  hintStyle: TextStyle(
        fontSize: 10,
      ),
         contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        //hintText: hintText,
        labelText: hintText,

      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '*Required';
        }
        return null;
      },
    );
  }

}
