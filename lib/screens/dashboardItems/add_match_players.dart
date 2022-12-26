import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:oo/apis/bloc/addplayer_bloc.dart';

import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/apis/repositories/joined_clubs.dart';

import '../../apis/repositories/add_club_repositories.dart';
import '../../constants/colors.dart';
import '../../constants/response.dart';

List<Map<String, String>> forAddPlayers = [];

class AddMatchPlayers extends StatefulWidget {
   AddMatchPlayers({Key? key,required this.player_id}) : super(key: key);
List player_id;
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
  void initState() {
    super.initState();
print("data->${widget.player_id}");
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
  ListView _jobsListView(data) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 8,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index].name}");
          return _tile(
            data[index].name,
            data[index].profilePic,
            data[index].id,
          );
        });
  }

  Container _tile(
      String title,
      String profilepic,
      int id,
      ) =>
      Container(
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
                "${title}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              if(widget.player_id[0].userId ==id )
              Visibility(
                child: TextButton(
                    onPressed: () {
                      print(id);
                      Upadateplayer.getEditPlayer(widget.player_id[0].playerId, id);
                    },
                    child: Text(
                      "Remove",
                      style:
                      TextStyle(color: ColorConstant.green6320, fontSize: 16),
                    )),
              ),
              if(widget.player_id[0].userId != id )
              Visibility(
                child: TextButton(
                    onPressed: () {
                      print(id);

                      Upadateplayer.getEditPlayer(widget.player_id[0].playerId, id);
                    },
                    child: Text(
                      "Add",
                      style:
                      TextStyle(color: ColorConstant.green6320, fontSize: 16),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
            ],
          ),
        ),
      );

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
        body: StreamBuilder<Response<AddPlayersModel>>(
            stream: _bloc?.AddPlayersStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    List<Players>? patientappointmentList =
                        snapshot.data!.data.players;
                    print("data=>${snapshot.data!.data.players![0].name}");
                    patientappointmentsearchdata = patientappointmentList;
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
                          patientappointmentList!.length != 0 ||
                              patientappointmentController.text.isNotEmpty
                              ? _jobsListView(patientappointmentList)
                              : _jobsListView(patientappointmentserachlist)
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container();
                }
              }
              return Container();
            }));
  }
}
