import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:oo/apis/bloc/addplayer_bloc.dart';

import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/apis/repositories/joined_clubs.dart';
import 'package:oo/screens/dashboardItems/addplayersformatches.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';

import '../../apis/repositories/add_club_repositories.dart';
import '../../constants/colors.dart';
import '../../constants/response.dart';

List<Map<String, String>> forAddPlayers = [];

class AddMatchPlayers extends StatefulWidget {
   AddMatchPlayers({Key? key,}) : super(key: key);

  @override
  State<AddMatchPlayers> createState() => _AddMatchPlayersState();
}

class _AddMatchPlayersState extends State<AddMatchPlayers> {
   AddPlayersBloc? _bloc;

  List<Players>? patientappointmentsearchdata = [];
  List<Players>? patientappointmentserachlist = [];

  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
   EditPlayerRepo Upadateplayer = EditPlayerRepo();
   Deleteplayer DeletePlayer =Deleteplayer();
  void initState() {
    super.initState();

    _bloc = AddPlayersBloc();
    _bloc?.getMyClubsList();
    print("forAddPlayers-.${forAddPlayers}");
  }

  getMyclubList() {
    _bloc?.getMyClubsList();
  }

  onSearchTextChanged(String text) async {
    patientappointmentserachlist!.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    patientappointmentsearchdata!.forEach((data) {
      if (data!.name!.toLowerCase().contains(text) || data.name!.contains(text))
        patientappointmentserachlist?.add(data);
    });

    setState(() {});
  }

  @override

  TextEditingController searchcontroller = new TextEditingController();
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
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Add Players",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            FloatingActionButton(backgroundColor: Colors.green[900],
              onPressed: () {   Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AddPlayersforMatchplayer()));

                // Add your onPressed code here!
              },
              child: const Icon(Icons.add,color: Colors.white),
            ),
          ],
        ),
        body:
        SingleChildScrollView(
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
                                patientappointmentController,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                                decoration: InputDecoration(
                                    hintText:
                                    "Search your player name",
                                    contentPadding: EdgeInsets.only(
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
          ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: datas.length,
              itemBuilder: (context, index) {
                print("data->>>>>>${datas[index].name}");
                return Container(
                  height: MediaQuery.of(context).size.height * 0.1,
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
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          "${datas[index].name}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),



                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.0,
                        ),
                        TextButton(
                            onPressed: () {
                              DeletePlayer.getDeleteplayer(datas[index].playerId!);
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
              })


            ],
          ),
        )


    );

  }
}
