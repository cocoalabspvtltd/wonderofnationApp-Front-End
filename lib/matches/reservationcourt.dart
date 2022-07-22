import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oo/matches/matchcourt.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import 'addplayers.dart';

class Reservationcourt extends StatefulWidget {
  const Reservationcourt({Key? key}) : super(key: key);

  @override
  State<Reservationcourt> createState() => _ReservationcourtState();
}

class _ReservationcourtState extends State<Reservationcourt> {
  @override
  List court = ["Court 1", "Court 2", "Court 3"];
  List times = ["10.00", "12.00", "14.00","19.00"];
  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());
  var date;
  var _valueToValidate3;
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        leading: IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Matchcourt(Imageurl: '',)));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Reservation Court",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      23,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "People of count",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 0.5,
                        color:Colors.grey,
                      ), // radius of 10
                      color: Colors.white // green as background color
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: minus,
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: ColorConstant.black900,
                          size: 30,
                        ),
                      ),
                      Text('$_n', style: TextStyle(fontSize: 40.0)),
                      IconButton(
                        onPressed: add,
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: ColorConstant.black900,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "The nearest dates",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: DateTimePicker(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: ColorConstant.black900,
                      size: 20,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color:Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                  type: DateTimePickerType.date,
                  dateMask: 'dd.MM.yy',
                  controller: dateinputcontroller,
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Select your time",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 50,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 5,);},
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: times.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: 85,
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: selectedIndex2 == index ? Colors.white : Colors.black,width: 0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                selected: selectedIndex1 == index? true: false,
                                selectedTileColor: ColorConstant.orange900,
                                selectedColor:ColorConstant.whiteA700 ,
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(times[index],style: TextStyle(
                                    color: selectedIndex1 == index ? Colors.white : Colors.black,),),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedIndex1 = index;
                                  });
                                },
                              )),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Select Court",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: SizedBox(
                  height: 50,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: court.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: 100,
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: selectedIndex2 == index ? Colors.white : Colors.black,width: 0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                selected: selectedIndex2 == index? true: false,
                                selectedTileColor: ColorConstant.orange900,
                                selectedColor:ColorConstant.whiteA700 ,
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(court[index],style: TextStyle(
                                    color: selectedIndex2 == index ? Colors.white : Colors.black,),),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedIndex2 = index;
                                  });
                                },
                              )),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 15,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Addplayers()));
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
                        border: Border.all(
                          width: 0.5,
                          color:Colors.grey,
                        ),
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(
                          10.00,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: ColorConstant.black900,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add Players",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                18,
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
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: Container(
                  height:120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "₹2500 ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  28,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "₹250 each ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      SizedBox(width: 120,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 45),
                          primary:  ColorConstant.orange900,
                          elevation: 2,
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10.0)
                          ),),
                        onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymentpage()));
                        },
                        child: Text(
                          "Book Now",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: getFontSize(
                              17,
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
            ],
          ),
        ),
      ),
    );
  }
}