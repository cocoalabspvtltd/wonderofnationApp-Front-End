import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/screens/dashboardItems/update_result.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import 'my_matches.dart';

class Pastmatches extends StatefulWidget {
  const Pastmatches({Key? key}) : super(key: key);

  @override
  State<Pastmatches> createState() => _PastmatchesState();
}

class _PastmatchesState extends State<Pastmatches> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray400,
        body: Container(
          width: size.width,
          child:
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: ColorConstant.gray400,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: getVerticalSize(
                      430.00,
                    ),
                    width: size.width,
                    margin: EdgeInsets.only(
                      bottom: getVerticalSize(
                        10.00,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/past.png",
                            height: getVerticalSize(
                              450.00,
                            ),
                            width: getHorizontalSize(
                              360.00,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                            top:10,
                            left:10,child: IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMatches(fragmentToShow: 0,)));
                        }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,))),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: getVerticalSize(
                        1.00,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          getHorizontalSize(
                            40.00,
                          ),
                        ),
                        topRight: Radius.circular(
                          getHorizontalSize(
                            40.00,
                          ),
                        ),
                        bottomLeft: Radius.circular(
                          getHorizontalSize(
                            0.00,
                          ),
                        ),
                        bottomRight: Radius.circular(
                          getHorizontalSize(
                            0.00,
                          ),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              50.00,
                            ),
                          ),
                          child: Container(
                            width: getHorizontalSize(
                              230.00,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                30.00,
                              ),
                            ),
                            child: Text(
                              "Seasonal \nChampionship(Tennis)",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              37.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    33.33,
                                  ),
                                  top: getVerticalSize(
                                    4.67,
                                  ),
                                  bottom: getVerticalSize(
                                    11.66,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    16.67,
                                  ),
                                  width: getHorizontalSize(
                                    13.33,
                                  ),
                                  child: Image.asset(
                                    "assets/images/location.png",
                                    fit: BoxFit.fill,color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    13.34,
                                  ),
                                  right: getHorizontalSize(
                                    135.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Club Name/ Sports Center",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          2.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        "3.5 km away",
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              18.00,
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
                                    33.00,
                                  ),
                                ),
                                child: Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  child: Image.asset(
                                    "assets/images/calender.png",
                                    fit: BoxFit.fill,color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    12.00,
                                  ),
                                  right: getHorizontalSize(
                                    148.00,
                                  ),
                                ),
                                child: Text(
                                  "21.08.2022  Monday , 19.00",
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              30.00,
                            ),
                            top: getVerticalSize(
                              30.00,
                            ),
                            right: getHorizontalSize(
                              30.00,
                            ),
                          ),
                          child: Text(
                            "Players",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.green6320,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              25.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    30.00,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: getVerticalSize(
                                        25.00,
                                      ),
                                      width: getHorizontalSize(
                                        56.00,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: getHorizontalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  getHorizontalSize(
                                                    12.50,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/user1.png",
                                                  height: getSize(
                                                    25.00,
                                                  ),
                                                  width: getSize(
                                                    25.00,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  15.00,
                                                ),
                                                right: getHorizontalSize(
                                                  16.00,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  getHorizontalSize(
                                                    12.50,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/user2.png",
                                                  height: getSize(
                                                    25.00,
                                                  ),
                                                  width: getSize(
                                                    25.00,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  getHorizontalSize(
                                                    12.50,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/user3.png",
                                                  height: getSize(
                                                    25.00,
                                                  ),
                                                  width: getSize(
                                                    25.00,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          6.50,
                                        ),
                                        top: getVerticalSize(
                                          5.00,
                                        ),
                                        bottom: getVerticalSize(
                                          5.00,
                                        ),
                                      ),
                                      child: Text(
                                        "and 2 more",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                30.00,
                              ),
                              top: getVerticalSize(
                                40.00,
                              ),
                              right: getHorizontalSize(
                                30.00,
                              ),
                              bottom: getVerticalSize(
                                20.00,
                              ),
                            ),
                            child: GestureDetector(onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => UpdateResult()));

                            },
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  45.00,
                                ),
                                width: getHorizontalSize(
                                  300.00,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black,width: 0.5),
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      5.00,
                                    ),

                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 100,),
                                    Text(
                                      "Update Result",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black901,
                                        fontSize: getFontSize(
                                          15,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}