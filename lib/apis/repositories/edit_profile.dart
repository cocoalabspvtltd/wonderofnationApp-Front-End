import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/profile/profile_page.dart';



class EditprofileRepostory{

  getEditprofile( context, String userName,userEmail,UserMobile,bio,reportFile) async {
    String fileName = reportFile.path.split('/').last;
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
                "name":userName,
                "email":userEmail,
                "phone":UserMobile,
                 "bio":bio,
                 "profilePic":"https://wonderofnation.com/WonderOfNations/public/storage/img/"+fileName,
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {

      final response = await WebApiProvider().getData(
          url:"profile-update",
          isPost:true,
          token:UserDetails.apiToken,
          queryParameters:_queryParameters,
          isQueryParmeter:true);
      Fluttertoast.showToast(msg: '${response['message']}');
    } catch (error) {
      print(error);
    }
  }
}

_showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0,),
        elevation: 0.0,
        title: Column(
          children: [
            Positioned(
              left: 10,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius:70,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset("assets/images/unnamed.gif")
                ),
              ),
            ),
            Text('Email Successfully Sent',style: TextStyle(color: Colors.green[900]),),
          ],
        ),
        // content: const Text('this is a demo alert diolog'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK',style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ForgotPassword{
  forgotpassword( String Email,context) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "email":Email,

    };
    print("_queryParameters : " + _queryParameters.toString());
    try {

      final response = await WebApiProvider().getData(
          url:"forgot/password/app",
          isPost:true,
          token:UserDetails.apiToken,
          queryParameters:_queryParameters,
          isQueryParmeter:true);

      if (response["success"] == true) {
        _showDialog(context);
      } else {

        throw response.statusCode;
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Enter Your Email");
    }
  }
}
