import 'package:flutter/material.dart';
import 'package:oo/homePage/navigator.dart';
import 'package:oo/myresults/gamedetail.dart';

class Gameslist extends StatefulWidget {
  const Gameslist({Key? key}) : super(key: key);

  @override
  State<Gameslist> createState() => _GameslistState();
}

class _GameslistState extends State<Gameslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Text("Choose the sport",style: TextStyle(color: Colors.black,fontSize: 15),),
        ),),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              color: Colors.grey[200],
                              child:ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Gamedetail()));
                                },
                                leading: Icon(Icons.sports_tennis,color: Colors.black,size: 20,),
                                title: Text("Tennis",style: TextStyle(color: Colors.black,fontSize: 18),),
                              )
                          ),
                        );
                      }
                  ),
                ),
              ],
            )
        ),
      ),
    );

  }
}