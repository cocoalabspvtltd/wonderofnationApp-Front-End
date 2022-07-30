import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/matches/reservationcourt.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';

class Addplayers extends StatefulWidget {
  const Addplayers({Key? key}) : super(key: key);

  @override
  State<Addplayers> createState() => _AddplayersState();
}

class _AddplayersState extends State<Addplayers> {
  @override

  Color _colorContainer = ColorConstant.orange900;
  String _contentContainer= "Remove";
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
                MaterialPageRoute(builder: (context) => ReservationCourt(club_id: 0, date: '',)));
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          title: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Text("Friends",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
          )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child:Column(
              children: [
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(onTap: (){

                  },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.2, horizontal: 1.0),
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
                ),
                GestureDetector(onTap: (){},
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount:7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 70,
                          child: Card(elevation: 0,
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    height:50,width: 50,
                                    child: Image.asset("assets/images/user2.png",fit: BoxFit.fill,),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("User Name",style: TextStyle(fontWeight: FontWeight.w500),),
                                ),
                                SizedBox(width: 40,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _contentContainer = _contentContainer == "Add" ?
                                      "Remove" :"Add";
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Container(width: 80,height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.black)
                                      ),
                                      child: Center(child: Text(_contentContainer,)),),
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),

                          ),
                        );

                      }
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 40),
                    primary:  ColorConstant.gray200,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10.0)
                    ),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservationCourt(date: '', club_id: 0,)));
                  },
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: getFontSize(
                        17,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            )
        ),
      ),
    );
  }
}