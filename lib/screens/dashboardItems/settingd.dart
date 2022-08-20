import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class Settingpage extends StatefulWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  var isDisable=false;
  var IsDisable=true;
  var disable=true;
  var Disable=true;
  var DisAble=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.indigo,
          ),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          title: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
          )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text("Profile",style: TextStyle(
                    color: ColorConstant.green6320,fontSize: 15),),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Private profile",style: TextStyle(color: ColorConstant.black901,fontSize: 15),),
                  ),
                  SizedBox(width: 180,),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: isDisable,
                          activeColor: ColorConstant.green6320,
                          activeTrackColor: Colors.grey[350],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[350],
                          onChanged: (check) {
                            setState(() {
                              isDisable = check;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNune ullamcorper eget ac turips par parturient",
                  style: TextStyle(color: ColorConstant.black901,fontSize: 13),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Divider(
                  thickness: 0.8,
                  color: ColorConstant.gray600,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Blocked accounts",style: TextStyle( color: ColorConstant.green6320,
                        fontSize: 15),),
                  ),
                  SizedBox(width: 170,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,size: 15, color: ColorConstant.black901,)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 20),
                child: Text("Notifications",style: TextStyle(
                    color: ColorConstant.green6320,fontSize: 15),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Follow notifications",style: TextStyle(color: ColorConstant.black901,fontSize: 15),),
                  ),
                  SizedBox(width: 140,),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: IsDisable,
                          activeColor: ColorConstant.green6320,
                          activeTrackColor: Colors.grey[350],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[350],
                          onChanged: (check) {
                            setState(() {
                              IsDisable = check;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(color: ColorConstant.black901,fontSize: 13),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Follow request accept notifications",style: TextStyle(color: ColorConstant.black901,fontSize: 15),),
                  ),
                  SizedBox(width: 35,),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: disable,
                          activeColor: ColorConstant.green6320,
                          activeTrackColor: Colors.grey[350],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[350],
                          onChanged: (check) {
                            setState(() {
                              disable = check;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(color: ColorConstant.black901,fontSize: 13),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Event notifications",style: TextStyle(color: ColorConstant.black901,fontSize: 15),),
                  ),
                  SizedBox(width: 145,),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: Disable,
                          activeColor: ColorConstant.green6320,
                          activeTrackColor: Colors.grey[350],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[350],
                          onChanged: (check) {
                            setState(() {
                              Disable = check;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(color: ColorConstant.black901,fontSize: 13),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 18,left: 20),
                child: Text("Location",style: TextStyle(
                    color: ColorConstant.green6320,fontSize: 15),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Approximate location",style: TextStyle( color: ColorConstant.black901,
                        fontSize: 15),),
                  ),
                  SizedBox(width: 127,),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: DisAble,
                          activeColor: ColorConstant.green6320,
                          activeTrackColor: Colors.grey[350],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[350],
                          onChanged: (check) {
                            setState(() {
                              DisAble = check;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(color: ColorConstant.black901,fontSize: 13),),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,),
                    child: Text("Delete my account",style: TextStyle( color: ColorConstant.gray600,
                        fontSize: 15),),
                  ),
                  SizedBox(width: 150,),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.delete,size: 18, color: ColorConstant.green6320,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}