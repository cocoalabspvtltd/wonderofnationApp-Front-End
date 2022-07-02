
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/addfriends/screenforprofileview.dart';


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
        leading: Icon(Icons.arrow_back_outlined,color: Colors.black,),
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
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.grey.shade100
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
        child: ListView.builder(
          shrinkWrap: true,
            physics: BouncingScrollPhysics(),

            padding: const EdgeInsets.all(8),
            itemCount:10,
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
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("UserName"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 57.0),
                        child: Container(width: 80,height: 30,

                        decoration: BoxDecoration(  color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(child: Text("confirm")),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Container(width: 80,height: 30,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent)
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
          (left: 308.0),
        child: Text("See all"),
      ),
      Padding(
        padding: const EdgeInsets.only
          (right: 208.0,top: 10),
        child: Text("Suggestions For You",style: TextStyle(color: Colors.blue),),
      ),
      ListView.builder(
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
                      padding: const EdgeInsets.only(left: 57.0),
                      child: Container(width: 80,height: 30,

                        decoration: BoxDecoration(  color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(child: Text("confirm")),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Container(width: 80,height: 30,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Center(child: Text("X")),),
                    ),
                  ],
                ),

              ),
            );

          }
      ),
    ],
  ),
),
    );
  }
}
