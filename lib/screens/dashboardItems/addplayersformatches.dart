import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:oo/apis/bloc/mybookingbloc.dart';
import 'package:oo/apis/bloc/myplayerbloc.dart';
import 'package:oo/apis/modelclass/addplayers_model.dart';

import 'package:oo/constants/colors.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/elements/LoadMoreListener.dart';
import 'package:oo/screens/dashboardItems/creating_matches_screen.dart';
import 'package:oo/screens/dashboardItems/privacy.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import '../../apis/repositories/add_club_repositories.dart';
import '../../constants/response.dart';
import '../homePage/navigator.dart';

List<Map<String, String>> forAddPlayers = [];

class AddPlayersforMatchplayer extends StatefulWidget {
  AddPlayersforMatchplayer({
    Key? key,required this.bookingid,required this.paymentstatus
  }) : super(key: key);
  String? bookingid;
  String paymentstatus;
  @override
  State<AddPlayersforMatchplayer> createState() => _AddPlayersforMatchplayerState();
}

class _AddPlayersforMatchplayerState extends State<AddPlayersforMatchplayer>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  var selectedTabPos = 0;
  late myplayerbloc _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  UpdatePalyer playerUpadtion = UpdatePalyer();
  List<Players>? playerssearchdata = [];
  List<Players>? playersserachlist = [];
  @override
  void initState() {
    print("My match Screen");
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

  paginate() async {
    print('paginate');
    await _bloc.getmyordersDetailsList(true);
  }

  void _scrollListener() async {
    if (_itemsScrollController.offset >=
        _itemsScrollController.position.maxScrollExtent &&
        !_itemsScrollController.position.outOfRange) {
      print("reach the bottom");
      if (_bloc.hasNextPage) {
        paginate();
      }
    }
    if (_itemsScrollController.offset <=
        _itemsScrollController.position.minScrollExtent &&
        !_itemsScrollController.position.outOfRange) {
      print("reach the top");
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

  late bool like;
  TextEditingController playersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.paymentstatus);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Add Players",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
        ),
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.white,
          onRefresh: () {
            return _bloc.getmyordersDetailsList(false);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: StreamBuilder<Response<AddPlayersModel>>(
                stream: _bloc.myplayerDetailsListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status!) {
                      case Status.LOADING:
                        return Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.height * 0.05,
                              child: CircularProgressIndicator()),
                        );
                      case Status.COMPLETED:
                        AddPlayersModel players_list = snapshot.data!.data;
                        List<Players>? players = players_list.players;
                        playerssearchdata = players;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 370,
                                  color: Colors.white,
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
                }),
          ),
        ));
  }

  Widget _jobsListView(playerlist) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:   ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: playerlist.length,
          itemBuilder: (context, index) {
            //  print("data->>>>>>${data[index].name}");
            return      Container(
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
                      "${playerlist[index].name}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          bool flag = false;
                          if (forAddPlayers.isNotEmpty) {
                            for (Map element in forAddPlayers) {
                              {
                                print("object");
                                print(element['id']);
                                if (element["id"] == playerlist[index].id.toString()) {
                                  Fluttertoast.showToast(msg: "Player Already Exist");
                                  flag = true;
                                  break;
                                }
                              }
                            }
                          } else {
                            playerUpadtion.getUpdateplayer(
                                playerlist[index].id!, playerlist[index].name!, index, context);
                            print("=${playerlist[index].id.toString()}");
                            Fluttertoast.showToast(msg: "Player Added");
                            Navigator.pop(context);
                            return;
                          }
                          if (flag == false) {
                            playerUpadtion.getUpdateplayer(
                                playerlist[index].id!, playerlist[index].name!, index, context);
                            Fluttertoast.showToast(msg: "Player Added");
                            Navigator.pop(context);
                            return;
                          }

                          //  print(forAddPlayers[0]["name"]);
                        },
                        child: Text(
                          "Add",
                          style:
                          TextStyle(color: ColorConstant.green6320, fontSize: 16),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0,
                    ),
                  ],
                ),
              ),
            );
          })
    );
  }
}