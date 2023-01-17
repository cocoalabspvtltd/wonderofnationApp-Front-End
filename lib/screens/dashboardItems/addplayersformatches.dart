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
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlayersforMatchplayer> createState() => _AddPlayersforMatchplayerState();
}

class _AddPlayersforMatchplayerState extends State<AddPlayersforMatchplayer>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  var selectedTabPos = 0;
  TabController? _tabController;
  late myplayerbloc _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  bool a = false;
  bool b = false;
  String mText1 = "See All";
  String mText2 = "See All";
  UpdatePalyer playerUpadtion = UpdatePalyer();
  @override
  void initState() {
    print("My match Screen");
    //_tabController = new TabController(vsync: this, length: 2);
    // selectedTabPos = widget.fragmentToShow != null ? widget.fragmentToShow : 0;
    // _tabController!.animateTo(selectedTabPos);
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

  TextEditingController searchcontroller = new TextEditingController();
  late bool like;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Text(
              "Add Players",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
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
                        AddPlayersModel resp = snapshot.data!.data;
                        return _bloc.myplayerDetailsList.isEmpty
                            ? SizedBox(
                          height:
                          MediaQuery.of(context).size.height - 180,
                          child: CommonApiResultsEmptyWidget(
                              "${resp.players!}",
                              textColorReceived: Colors.black),
                        )
                            : _buildProductSavedListView(
                            _bloc.myplayerDetailsList!);
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
  TextEditingController patientappointmentController = TextEditingController();
  Widget _buildProductSavedListView(List<Players> productDetails) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                              hintText: "Search your player name",
                              contentPadding: EdgeInsets.only(
                                left: 80,
                              ),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 32.0),
                                  borderRadius: BorderRadius.circular(5.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 32.0),
                                  borderRadius: BorderRadius.circular(25.0))),
                          // onChanged: onSearchTextChanged
                        ),
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
              itemCount: productDetails.length,
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
                          "${productDetails[index].name}",
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
                                    if (element["id"] == productDetails[index].id.toString()) {
                                      Fluttertoast.showToast(msg: "Player Already Exist");
                                      flag = true;
                                      break;
                                    }
                                  }
                                }
                              } else {
                                playerUpadtion.getUpdateplayer(
                                    productDetails[index].id!, productDetails[index].name!, index, context);
                                Fluttertoast.showToast(msg: "Player Added");
                                return;
                              }
                              if (flag == false) {
                                playerUpadtion.getUpdateplayer(
                                    productDetails[index].id!, productDetails[index].name!, index, context);
                                Fluttertoast.showToast(msg: "Player Added");
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
                        // TextButton(
                        //     onPressed: () {
                        //       print(forAddPlayers
                        //           .contains({"name": title, "dp": profilepic}));
                        //       forAddPlayers
                        //           .removeWhere((element) => element["name"] == title);
                        //       Fluttertoast.showToast(msg: "Player Deleted");
                        //       forAddPlayers.forEach((element) {
                        //         print(element);
                        //       });
                        //     },
                        //     child: Text(
                        //       "Remove",
                        //       style: TextStyle(color: Colors.red, fontSize: 16),
                        //     )),
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
    );
  }
}
