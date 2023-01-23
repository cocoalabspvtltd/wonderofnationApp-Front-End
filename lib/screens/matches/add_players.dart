import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:oo/apis/bloc/addplayer_bloc.dart';
import 'package:oo/apis/bloc/myplayerbloc.dart';

import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/apis/repositories/joined_clubs.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/elements/LoadMoreListener.dart';

import '../../constants/colors.dart';
import '../../constants/response.dart';

List<Map<String, String>> forAddPlayers = [];

class AddPlayers extends StatefulWidget {
  AddPlayers({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}
 class _AddPlayersState extends State<AddPlayers> with LoadMoreListener {
   late myplayerbloc _bloc;

   List<Players>? playerssearchdata = [];
   List<Players>? playersserachlist = [];
   late ScrollController _itemsScrollController;
   bool isLoadingMore = false;

   TextEditingController playersController = TextEditingController();

   void initState() {
     _bloc = myplayerbloc(listener: this);
     _bloc.getmyordersDetailsList(false);
     _itemsScrollController = ScrollController();
     _itemsScrollController.addListener(_scrollListener);
     super.initState();
   }
   @override
   refresh(bool isLoading) {
     if (mounted) {
       setState(() {
         isLoadingMore = isLoading;
       });
     }
   }

   onSearchTextChanged(String text) async {
     playersserachlist!.clear();
     if (text.isEmpty) {
       setState(() {});
       return;
     }

     playerssearchdata!.forEach((data) {
       if (data!.name!.toLowerCase().contains(text) ||
           data.name!.contains(text))
         playersserachlist?.add(data);
     });

     setState(() {});
   }

   paginate() async {
     await _bloc.getmyordersDetailsList(true);
   }

   void _scrollListener() async {
     if (_itemsScrollController.offset >=
         _itemsScrollController.position.maxScrollExtent &&
         !_itemsScrollController.position.outOfRange) {
       print("reach the bottom");
       // if (_bloc.hasNextPage) {
       paginate();
       //}
     }
     if (_itemsScrollController.offset <=
         _itemsScrollController.position.minScrollExtent &&
         !_itemsScrollController.position.outOfRange) {
       print("reach the top");
     }
   }

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
             leading: IconButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 icon: Icon(
                   Icons.arrow_back,
                   color: Colors.black,
                 )),
             title: Padding(
               padding: const EdgeInsets.only(left: 30, right: 30),
               child: Text(
                 "Players List",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 15,
                     fontWeight: FontWeight.w400),
               ),
             )),
         body: StreamBuilder<Response<AddPlayersModel>>(
             stream: _bloc.myplayerDetailsListStream,
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 print("sdfghjk");
                 switch (snapshot.data!.status) {
                   case Status.LOADING:
                     return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                     break;
                   case Status.COMPLETED:
                     AddPlayersModel players_list = snapshot.data!.data;
                     List<Players>? players = players_list.players;
                     print("palyers---->${players}");
                     playerssearchdata = players;
                     return SingleChildScrollView(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                               width: 370,
                               color: Colors.white,
                               // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                               margin: EdgeInsets.all(15),
                               child: Padding(
                                 padding: const EdgeInsets.all(0),
                                 child: Material(
                                   color: Colors.white,
                                   child: Row(
                                     mainAxisSize: MainAxisSize.min,
                                     children: <Widget>[
                                       Expanded(
                                         child: TextField(
                                             controller:
                                             playersController,
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                               color: Colors.black54,
                                             ),
                                             decoration: InputDecoration(
                                                 hintText:
                                                 "Search your player name",
                                                 contentPadding: EdgeInsets
                                                     .only(
                                                   left: 80,
                                                 ),
                                                 prefixIcon: Icon(Icons.search),
                                                 border: OutlineInputBorder(
                                                     borderSide: BorderSide(
                                                         color: Colors.black54,
                                                         width: 32.0),
                                                     borderRadius:
                                                     BorderRadius
                                                         .circular(5.0)),
                                                 focusedBorder:
                                                 OutlineInputBorder(
                                                     borderSide:
                                                     BorderSide(
                                                         color: Colors
                                                             .black54,
                                                         width: 32.0),
                                                     borderRadius:
                                                     BorderRadius
                                                         .circular(
                                                         25.0))),
                                             onChanged: onSearchTextChanged),
                                       ),
                                     ],
                                   ),
                                 ),
                               )),
                           SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                           playersserachlist!.length != 0 ||
                               playersController.text.isNotEmpty
                               ? _jobsListView(playersserachlist)
                               : _jobsListView(players)
                         ],
                       ),
                     );

                     break;
                   case Status.ERROR:
                     return CommonApiResultsEmptyWidget(
                         "${snapshot.data!.message!}",
                         textColorReceived: Colors.black);
                 }
               }
               return Center(
                 child: SizedBox(
                     width: MediaQuery.of(context).size.height * 0.05,
                     child: CircularProgressIndicator()),
               );
             }));
   }

   Widget _jobsListView(playerslist) {
     return Padding(
       padding: const EdgeInsets.all(20.0),
       child: ListView.separated(
           separatorBuilder: (context, index) =>
               SizedBox(
                 height: 8,
               ),
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: playerslist.length,
           itemBuilder: (context, index) {
             return
               Container(
                 height: MediaQuery
                     .of(context)
                     .size
                     .height * 0.1,
                 child: Card(
                   elevation: 0,
                   child: Row(
                     children: [
                       Container(
                         height: 50,
                         width: 50,
                         child: Image.asset(
                           "assets/images/user2.png",
                           fit: BoxFit.fill,
                         ),
                       ),
                       SizedBox(
                         width: MediaQuery
                             .of(context)
                             .size
                             .width * 0.03,
                       ),
                       Text(
                         "${playerslist[index].name}",
                         style: TextStyle(fontWeight: FontWeight.w500),
                       ),
                       Spacer(),
                       TextButton(
                           onPressed: () {
                             print(playerslist[index].id);
                             bool flag = false;
                             if (forAddPlayers.isNotEmpty) {
                               for (Map element in forAddPlayers) {
                                 {
                                   print("object");
                                   print(element['id']);
                                   if (element["id"] ==
                                       playerslist[index].id.toString()) {
                                     Fluttertoast.showToast(
                                         msg: "Player Already Exist");
                                     flag = true;
                                     break;
                                   }
                                 }
                               }
                             } else {
                               forAddPlayers.add({
                                 "name": playerslist[index].name!,
                                 "dp": playerslist[index].profilePic!,
                                 "id": playerslist[index].id.toString(),
                               });
                               Fluttertoast.showToast(msg: "Player Added");
                               return;
                             }
                             if (flag == false) {
                               forAddPlayers.add({
                                 "name": playerslist[index].name!,
                                 "dp": playerslist[index].profilePic!,
                                 "id": playerslist[index].id.toString(),
                               });
                               Fluttertoast.showToast(msg: "Player Added");
                               return;
                             }

                             //  print(forAddPlayers[0]["name"]);
                           },
                           child: Text(
                             "Add",
                             style:
                             TextStyle(
                                 color: ColorConstant.green6320, fontSize: 16),
                           )),
                       SizedBox(
                         width: MediaQuery
                             .of(context)
                             .size
                             .width * 0.0,
                       ),
                       TextButton(
                           onPressed: () {
                             print(forAddPlayers
                                 .contains({
                               "name": playerslist[index].name,
                               "dp": playerslist[index].profilePic
                             }));
                             forAddPlayers
                                 .removeWhere((element) =>
                             element["name"] == playerslist[index].name);
                             Fluttertoast.showToast(msg: "Player Deleted");
                             forAddPlayers.forEach((element) {
                               print(element);
                             });
                           },
                           child: Text(
                             "Remove",
                             style: TextStyle(color: Colors.red, fontSize: 16),
                           )),
                       SizedBox(
                         width: MediaQuery
                             .of(context)
                             .size
                             .width * 0.01,
                       ),
                     ],
                   ),
                 ),
               );
           }),
     );
   }

 }
