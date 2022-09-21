import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/screens/homePage/navigator.dart';
import 'package:oo/screens/myresults/game_detail.dart';

class Gameslist extends StatefulWidget {
  var games = ['Tennis', 'Football', 'Cricket','Swimming', 'Badminton','Golf'];

  @override
  State<Gameslist> createState() => _GameslistState();
}

class _GameslistState extends State<Gameslist> {
  @override
  var games = ['Tennis', 'Football', 'Cricket','Swimming', 'Badminton','Golf'];
  List _iconTypes = [Icons.sports_tennis, Icons.sports_baseball, Icons.sports_cricket,
    Icons.pool_outlined,
    CupertinoIcons.sportscourt,
    Icons.sports_golf,
  ];
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(UserName1: '',)));
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
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: games.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 65,
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              color: Colors.grey[200],
                              child:ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GameDetail(
                                      games : widget.games[index]
                                  )));
                                },
                                leading: Icon(_iconTypes[index],color: Colors.black,size: 20,),
                                title: Text(games[index],style: TextStyle(color: Colors.black,fontSize: 18),),
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