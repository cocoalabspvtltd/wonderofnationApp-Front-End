import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';

class AddMatchPlayers extends StatefulWidget {
  const AddMatchPlayers({Key? key}) : super(key: key);

  @override
  State<AddMatchPlayers> createState() => _AddMatchPlayersState();
}

class _AddMatchPlayersState extends State<AddMatchPlayers> {
  @override
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
                MaterialPageRoute(builder: (context) => Upcomingmatch()));
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          title: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Text("Friends",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
          )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.2),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          width:0.5,
                          color:Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount:7,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Card(
                              elevation: 0,
                              child: Row(
                                children: [
                                  Container(
                                    height:50,width: 50,
                                    child: Image.asset("assets/images/user2.png",fit: BoxFit.fill,),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                  Text("User Name",style: TextStyle(fontWeight: FontWeight.w500),),
                                  Spacer(),
                                  TextButton(
                                      onPressed: () {
                                      },
                                      child: Text(
                                        "Add",
                                        style:
                                        TextStyle(color: ColorConstant.green6320, fontSize: 16),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.0,
                                  ),
                                  TextButton(
                                      onPressed: (){
                                      },
                                      child: Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.red, fontSize: 16),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.01,
                                  ),
                                ],
                              ),

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}