
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../homePage/navigator.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  var buttonText = 'Follow';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashBoard(UserName1: '',)));
            },
            icon: Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            )),
        title: Padding(
            padding: EdgeInsets.only(left: 297),
            child: Image.asset("assets/images/menudots.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Image.asset("assets/images/profileimage.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                "UserName",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Professional Tennis Player",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              width: getHorizontalSize(
                311.00,
              ),
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  10.00,
                ),
                top: getVerticalSize(
                  7.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. \nVestibulum, accumsan, felis fermentum dui diam ",
                maxLines: null,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.black900,
                  fontSize: getFontSize(
                    11,
                  ),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    28.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        53.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          59.00,
                        ),
                      ),
                      child: Text(
                        "70\nMatches",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        59.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          39.00,
                        ),
                      ),
                      child: Text(
                        "8000\nFollowers",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        58.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          39.00,
                        ),
                        right: getHorizontalSize(
                          53.00,
                        ),
                      ),
                      child: Text(
                        "400\nFollowing",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            13,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
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
                  37.00,
                ),
                right: getHorizontalSize(
                  20.00,
                ),
                bottom: getVerticalSize(
                  20.00,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    buttonText =
                    buttonText == "Follow" ? "Unfollow" : "Follow";
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    37.00,
                  ),
                  width: size.width,
                  decoration: BoxDecoration(
                      color: buttonText == "Follow" ? ColorConstant.green6320: Colors.white10,
                      borderRadius: BorderRadius.circular(18.50),
                      border: Border.all(
                        color: buttonText == "Follow" ? Colors.white : Colors.black,
                      )
                  ),
                  child: Text(buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: buttonText == "Follow" ? Colors.white : Colors.black,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}