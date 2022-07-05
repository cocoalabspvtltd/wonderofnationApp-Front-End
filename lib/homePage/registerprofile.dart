
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/homePage/register.dart';


import '../constants/colors.dart';
import '../constants/mathUtils.dart';


class RegisterProfile extends StatefulWidget {
  const RegisterProfile({Key? key}) : super(key: key);
  void initState() {
    print("username->${username}");


  }
  @override
  State<RegisterProfile> createState() => _RegisterProfileState();
}

class _RegisterProfileState extends State<RegisterProfile> {

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.indigo900,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
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
                          112.00,
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
                          Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hai ',
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        24,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text:" ${username}",
                                    style: TextStyle(
                                      color: ColorConstant.orange900,
                                      fontSize: getFontSize(
                                        24,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  60.00,
                                ),
                                top: getVerticalSize(
                                  13.00,
                                ),
                                right: getHorizontalSize(
                                  56.00,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Complete your profile to start playing",
                                  overflow: TextOverflow.ellipsis,
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              top: getVerticalSize(
                                51.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child:InkWell(
                              onTap: pickImage,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 48.0,
                                child: CircleAvatar(
                                  radius: 48.0,
                                  backgroundColor: Colors.white,
                                  child: Container(height: 150,
                                    child: ClipOval(
                                      child: (image != null)
                                          ? Image.file(image!,fit: BoxFit.fill,)
                                          : Image.asset('assets/images/profile.png'),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child: Text(
                              "Upload your photo",
                              overflow: TextOverflow.ellipsis,
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
                          Padding(
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
                            ),
                            child: Text(
                              "Select your favourite sport",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.orange900,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  51.00,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        45.00,
                                      ),
                                    ),
                                    child: GestureDetector(onTap: (){

                                    },
                                      child: GestureDetector(onTap: (){
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) =>  levelling1()),
                                        // );
                                      },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: getVerticalSize(
                                            35.00,
                                          ),
                                          width: getHorizontalSize(
                                            125.00,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.indigo900,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            border: Border.all(
                                              color: ColorConstant.bluegray100,
                                              width: getHorizontalSize(
                                                1.00,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Cricket",
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
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        21.00,
                                      ),
                                      right: getHorizontalSize(
                                        44.00,
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        35.00,
                                      ),
                                      width: getHorizontalSize(
                                        125.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.indigo900,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: ColorConstant.bluegray100,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Tennis",
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
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  36.00,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        45.00,
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        35.00,
                                      ),
                                      width: getHorizontalSize(
                                        125.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.indigo900,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: ColorConstant.bluegray100,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Football",
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
                                        21.00,
                                      ),
                                      right: getHorizontalSize(
                                        44.00,
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        35.00,
                                      ),
                                      width: getHorizontalSize(
                                        125.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.indigo900,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: ColorConstant.bluegray100,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Golf",
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
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              top: getVerticalSize(
                                36.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
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
                                "Register",
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
    );
  }

  _buildImageSection() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      alignment: FractionalOffset.center,
      width: double.infinity,
      height: 150,
      color: Colors.transparent,
      child: Container(
        height: 150.0,
        width: 150.0,
        child: Stack(children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
              color: Colors.black26,
              borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
              border: new Border.all(
                color: Colors.grey,
                width: 4.0,
              ),
            ),
            child: ClipOval(
              child: SizedBox.expand(
                child: showImage(),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: GestureDetector(
                child: Image.asset(
                  ('assets/images/ic_camera.png'),
                  height: 50,
                  width: 50,
                ),
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 60);

                  if(pickedFile!=null){
                    image = File(pickedFile.path);
                    setState(() {  });
                  }
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
  Widget showImage() {
    return Center(
      child: image == null
          ? CachedNetworkImage(
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Center(
          child: Image(
            image:
            AssetImage('assets/images/ic_avatar.png',),color: Colors.white,
          ),
        ), imageUrl: '',
      )
          : Container(
        height: 140.0,
        width: 140.0,
        child: SizedBox.expand(
          child: Image.file(
            image!,
            fit: BoxFit.cover,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(70.0)),
        ),
      ),
    );
  }
}
