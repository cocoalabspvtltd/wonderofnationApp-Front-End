import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class Matchhome extends StatefulWidget {
  const Matchhome({Key? key}) : super(key: key);

  @override
  State<Matchhome> createState() => _MatchhomeState();
}

class _MatchhomeState extends State<Matchhome> {

  @override

  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        title: Row(
          children: [
            SizedBox(
              width: 180,
            ),
            Container(child: Image.asset("assets/images/search.png")),
            SizedBox(
              width: 30,
            ),
            Container(child: Image.asset("assets/images/notification.png")),
            SizedBox(
              width: 30,
            ),
            Container(child: Image.asset("assets/images/chat.png")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding( padding: EdgeInsets.only(
                    top: getVerticalSize(
                      33.50,
                    ),
                    bottom: getVerticalSize(
                      20.00,
                    ),
                  ),

          child: Column(
            children: [
              Container(
                width: getHorizontalSize(
                  140.00,
                ),
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    0.00,
                  ),
                  right: getHorizontalSize(
                    170.00,
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create your \n',
                        style: TextStyle(
                          color: ColorConstant.indigo900,
                          fontSize: getFontSize(
                            24,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'matches',
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
              Padding(

                           padding: EdgeInsets.only(
                             top: getVerticalSize(
                               24.00,
                             ),
                         ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: getVerticalSize(
                        40.00,
                      ),
                      width: getHorizontalSize(
                        100.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        bottom: getVerticalSize(
                          1.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        border: Border.all(
                          color: ColorConstant.indigo900,
                          width: getHorizontalSize(
                            1.00,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            24.00,
                          ),
                          top: getVerticalSize(
                            13.00,
                          ),
                          bottom: getVerticalSize(
                            12.00,
                          ),
                        ),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            focusNode: FocusNode(),
                            icon: Image.asset(
                              "assets/images/dropdown.png",
                              height: getSize(
                                5.17,
                              ),
                              width: getSize(
                                10.33,
                              ),

                            ),
                            style: TextStyle(
                              color:
                              ColorConstant.indigo900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (value) {},
                            items: dropdownItemList.map<
                                DropdownMenuItem<
                                    String>>(
                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      textAlign:
                                      TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                            decoration: InputDecoration(
                              hintText: '  Tennis',
                              hintStyle: TextStyle(
                                fontSize: getFontSize(
                                  12.0,
                                ),
                                color:
                                ColorConstant.indigo900,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding:
                              EdgeInsets.only(right: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          10.00,
                        ),
                        bottom: getVerticalSize(
                          1.00,
                        ),
                      ),
                      child: GestureDetector(onTap: (){
                        print("hg");
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2019, 1),
                          lastDate: DateTime(2021,12),
                        );
                      },
                        child: Container(
                          height: getVerticalSize(
                            40.00,
                          ),
                          width: getHorizontalSize(
                            100.00,
                          ),
                          child: TextFormField(
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              hintText: '11.07.22',
                              hintStyle: TextStyle(
                                fontSize: getFontSize(
                                  12.0,
                                ),
                                color: ColorConstant.black900,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: ColorConstant.indigo900,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: ColorConstant.indigo900,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: ColorConstant.indigo900,
                                  width: 1,
                                ),
                              ),
                              prefixIcon: Container(
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    13.00,
                                  ),
                                  right: getHorizontalSize(
                                    9.00,
                                  ),
                                  bottom: getVerticalSize(
                                    12.00,
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
                                 "assets/images/calender.png",color: Colors.black,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: getSize(
                                  15.00,
                                ),
                                minHeight: getSize(
                                  15.00,
                                ),
                              ),
                              filled: true,
                              fillColor: ColorConstant.whiteA700,
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                top: getVerticalSize(
                                  13.00,
                                ),
                                right: getHorizontalSize(
                                  21.00,
                                ),
                                bottom: getVerticalSize(
                                  12.00,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                12.0,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
