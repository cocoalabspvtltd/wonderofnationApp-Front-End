
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/addfriends/screenforprofileview.dart';
import 'package:oo/homePage/navigator.dart';

import '../constants/colors.dart';


class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  @override
  final List<String> entries = <String>['', 'B', 'C'];
  final List images = ["assets/images/user.png","assets/images/user.png","assets/images/user.png"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),);
        }, icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),),
        title: Padding(
          padding: const EdgeInsets.only(left: 58.0),
          child: Text("Follow Request",style: TextStyle(color: Colors.black,fontSize: 17),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(onTap: (){

              },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.only(top: 0.1,bottom: 0.1),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                          color: Colors.black,width: 0.2
                      )
                  ),
                ),
              ),
            ),
            GestureDetector(onTap:
                (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Profileview()),
              );
            },
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height:4 ,);},
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount:6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(height: 60,
                      child: Card(elevation: 0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(height:50,width: 50,
                                child: Image.asset("assets/images/user1.png",fit: BoxFit.fill,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("UserName"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Container(width: 80,height: 35,
                                decoration: BoxDecoration(  color: ColorConstant.green6320,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white)
                                ),
                                child: Center(child: Text("confirm",style: TextStyle(color:
                                ColorConstant.whiteA700,),)),),
                            ),
                            SizedBox(width: 6),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(width: 80,height: 35,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color:
                                    ColorConstant.green6320,)
                                ),
                                child: Center(child: Text("Delete")),),
                            ),
                          ],
                        ),

                      ),
                    );

                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only
                (left: 300.0),
              child: Text("See all",style: TextStyle(color:
              ColorConstant.green6320,),),
            ),
            Padding(
              padding: const EdgeInsets.only
                (right: 208.0,top: 10),
              child: Text("Suggestions For You",style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 10,),
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height:4 ,);},
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount:6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(height: 60,
                    child: Card(elevation: 0,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(height:60,width: 50,
                              child: Image.asset("assets/images/user2.png",fit: BoxFit.fill,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text("UserName"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Container(width: 80,height: 35,
                              decoration: BoxDecoration(  color:
                              ColorConstant.green6320,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white)
                              ),
                              child: Center(child: Text("Follow",style: TextStyle(color:
                              ColorConstant.whiteA700,),)),),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10.0),
                          //   child: Container(width: 80,height: 30,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         border: Border.all(color: Colors.blueAccent)
                          //     ),
                          //     child: Center(child: Text("X")),),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 20,)),
                          )
                        ],
                      ),

                    ),
                  );

                }
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only
                (left: 200.0),
              child: Text("See all suggestions",style: TextStyle(color:
              ColorConstant.gray600,),),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}