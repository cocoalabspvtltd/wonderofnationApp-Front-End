import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/homePage/navigator.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class Matchhome extends StatefulWidget {
  const Matchhome({Key? key}) : super(key: key);

  @override
  State<Matchhome> createState() => _MatchhomeState();

}

class _MatchhomeState extends State<Matchhome> {
  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override

  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];
  TextEditingController dateinputcontroller=new TextEditingController(
      text: DateTime.now().toString());

  var date;
  var _valueToValidate3;
  var _valueChanged4;
  var _valueToValidate4;
  var _valueSaved4;


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        leading: IconButton(onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoard()));
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(child: Image.asset("assets/images/search.png")),
            ),
            SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(child: Image.asset("assets/images/notification.png")),
            ),
            SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(child: Image.asset("assets/images/chat.png")),
            ),

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
                    SizedBox(width: 5,),
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: DateTimePicker(
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                          prefixIcon: Icon(Icons.calendar_month,color: Colors.orange[700],size: 15,),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.indigo900,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.indigo900,
                            ),
                          ),
                        ),
                        type: DateTimePickerType.date,
                        dateMask: 'dd.MM.yy',
                        controller:dateinputcontroller ,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2060),
                        onChanged: (val) => setState(() => date = val),
                        validator: (val) {
                          setState(() => _valueToValidate3 = val ?? '');
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: TextFormField(
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                          prefixIcon: IconButton(onPressed: _show, icon: Icon(Icons.access_time,color: Colors.orange[700],size: 20,)),
                          label: Text(_selectedTime != null ? _selectedTime! : 'Select',
                            style: TextStyle(fontSize: 13,color: Colors.black),),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.indigo900,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConstant.indigo900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}