import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/screens/google_signin.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import '../apis/repositories/register_Repositories.dart';
import '../constants/colors.dart';
import '../constants/math_utils.dart';
import 'forgotpassword/forgot_passwordscreen.dart';
import 'homePage/home_page1.dart';
import 'homePage/register.dart';
String login_button = "LOGIN";
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  @override

  bool _passwordVisible = false;
  //AuthBlocUser _authBloc = AuthBlocUser();
  void initState() {
    _passwordVisible = false;
    setState(() {    passwordController1.text= "";});

  }

  TextEditingController passwordController1 = TextEditingController();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass){

    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
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
      'password': passwordController1.text,

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
        MaterialPageRoute(builder: (context) =>  HomePage(RegisterName: '',)),
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
                                    top: 20
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
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      60.00,
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
                                            color: ColorConstant.green6320,
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

                                  width: getHorizontalSize(
                                    320.00,
                                  ),
                                  child:   Padding(
                                    padding: const EdgeInsets.only(bottom: 15,),
                                    child: TextFormField(controller: EmailLoginController,
                                      keyboardType: TextInputType.name,
                                      decoration:InputDecoration(hintText: "UserName",
                                        errorText:
                                        _validatePassword ? 'Please fill this field' : null,
                                        contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '*Required';
                                        }
                                        return null;
                                      },
                                      onSaved: (String? value){
                                        EmailLoginController.text = value!;
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
                                child:
                                Container(
                                    child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15,),
                                    child: TextFormField(

                                      controller: passwordController1,
                                      keyboardType: TextInputType.text,
                                      obscureText: _isobsucure,

                                      decoration:InputDecoration(hintText: "Password",
                                                suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _isobsucure ? Icons.visibility : Icons.visibility_off,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {


                                                        _isobsucure = !_isobsucure;

                                                      });
                                                    }),
                                        errorText:
                                        _validatePassword ? 'Please fill this field' : null,
                                        contentPadding:
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
                                        passwordController1.text = value!;
                                      },
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
                                    child: TextButton(
                                      onPressed: () async{
                                        print("loading");

                                        setState(() {
                                          if (_formKey.currentState!.validate()) {
                                            print("Form was Submitted Successfully");
                                            passwordController1.text.isEmpty
                                                ? _validate = true
                                                : _validate = false;
                                            passwordController1.text.isEmpty
                                                ? _validatePassword = true
                                                : _validatePassword = false;
                                          }
                                        });

                                      //  EasyLoading.showProgress(0.3, status: 'downloading...');
                                      await  loginApiCall.createUser(EmailLoginController.text,
                                            passwordController1.text, context);

                                      },
                                      child: Container(height: 40,width: 360,
                                        decoration: BoxDecoration(color: ColorConstant.green6320,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(
                                          child: Text(
                                          login_button,
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
                                        80.00,
                                      ),
                                      top: getVerticalSize(
                                        48.00,
                                      ),
                                      right: getHorizontalSize(
                                        80.00,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
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
                                          child: GestureDetector(onTap: (){ Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  SignInDemo()),
                                          );

                                          },
                                            child: Text(
                                              "Or Continue with",
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


  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }



}
