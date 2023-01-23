// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:oo/apis/bloc/addplayer_bloc.dart';
// import 'package:oo/apis/bloc/myplayerbloc.dart';
//
// import 'package:oo/apis/modelclass/addplayers_model.dart';
//
// import 'package:oo/apis/repositories/joined_clubs.dart';
//
// import '../../constants/colors.dart';
// import '../../constants/response.dart';
//
// List<Map<String, String>> forAddPlayers = [];
//
// class AddPlayers extends StatefulWidget {
//   const AddPlayers({Key? key}) : super(key: key);
//
//   @override
//   State<AddPlayers> createState() => _AddPlayersState();
// }
//
// class _AddPlayersState extends State<AddPlayers> {
// late myplayerbloc _bloc;
//
//   List<Players>? patientappointmentsearchdata = [];
//   List<Players>? patientappointmentserachlist = [];
//   late ScrollController _itemsScrollController;
//   bool isLoadingMore = false;
//   TextEditingController patientappointmentController = TextEditingController();
//   ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
//   void initState() {
//     super.initState();
//     _bloc = myplayerbloc();
//     _bloc.getmyordersDetailsList(false);
//     _itemsScrollController = ScrollController();
//     _itemsScrollController.addListener(_scrollListener);
//     _bloc = AddPlayersBloc();
//     _bloc.getMyClubsList();
//     print("forAddPlayers-.${forAddPlayers}");
//   }
//
//   getMyclubList() {
//     _bloc.getMyClubsList();
//   }
//
//   onSearchTextChanged(String text) async {
//     patientappointmentserachlist!.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }
//
//     patientappointmentsearchdata!.forEach((data) {
//       if (data!.name!.toLowerCase().contains(text) || data.name!.contains(text))
//         patientappointmentserachlist?.add(data);
//     });
//
//     setState(() {});
//   }
//
//   @override
//   ListView _jobsListView(data) {
//     return ListView.separated(
//         separatorBuilder: (context, index) => SizedBox(
//               height: 8,
//             ),
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           print("data->>>>>>${data[index].name}");
//           return _tile(
//             data[index].name,
//             data[index].profilePic,
//             data[index].id,
//           );
//         });
//   }
//
//   Container _tile(
//     String title,
//     String profilepic,
//     int id,
//   ) =>
//       Container(
//         height: MediaQuery.of(context).size.height * 0.1,
//         child: Card(
//           elevation: 0,
//           child: Row(
//             children: [
//               Container(
//                 height: 50,
//                 width: 50,
//                 child: Image.asset(
//                   "assets/images/user2.png",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.03,
//               ),
//               Text(
//                 "${title}",
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//               Spacer(),
//               TextButton(
//                   onPressed: () {
//                     print(id);
//                     bool flag = false;
//                     if (forAddPlayers.isNotEmpty) {
//                       for (Map element in forAddPlayers) {
//                         {
//                           print("object");
//                           print(element['id']);
//                           if (element["id"] == id.toString()) {
//                             Fluttertoast.showToast(msg: "Player Already Exist");
//                             flag = true;
//                             break;
//                           }
//                         }
//                       }
//                     } else {
//                       forAddPlayers.add({
//                         "name": title,
//                         "dp": profilepic,
//                         "id": id.toString(),
//                       });
//                       Fluttertoast.showToast(msg: "Player Added");
//                       return;
//                     }
//                     if (flag == false) {
//                       forAddPlayers.add({
//                         "name": title,
//                         "dp": profilepic,
//                         "id": id.toString()
//                       });
//                       Fluttertoast.showToast(msg: "Player Added");
//                       return;
//                     }
//
//                     //  print(forAddPlayers[0]["name"]);
//                   },
//                   child: Text(
//                     "Add",
//                     style:
//                         TextStyle(color: ColorConstant.green6320, fontSize: 16),
//                   )),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.0,
//               ),
//               TextButton(
//                   onPressed: () {
//                     print(forAddPlayers
//                         .contains({"name": title, "dp": profilepic}));
//                     forAddPlayers
//                         .removeWhere((element) => element["name"] == title);
//                     Fluttertoast.showToast(msg: "Player Deleted");
//                     forAddPlayers.forEach((element) {
//                       print(element);
//                     });
//                   },
//                   child: Text(
//                     "Remove",
//                     style: TextStyle(color: Colors.red, fontSize: 16),
//                   )),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.01,
//               ),
//             ],
//           ),
//         ),
//       );
//
//   TextEditingController searchcontroller = new TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             elevation: 0,
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             iconTheme: const IconThemeData(
//               color: Colors.indigo,
//             ),
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.black,
//                 )),
//             title: Padding(
//               padding: const EdgeInsets.only(left: 30, right: 30),
//               child: Text(
//                 "Players List",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400),
//               ),
//             )),
//         body: StreamBuilder<Response<AddPlayersModel>>(
//             stream: _bloc.myordersDetailsListStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 print("sdfghjk");
//                 switch (snapshot.data!.status) {
//                   case Status.LOADING:
//                     return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
//                     break;
//                   case Status.SUCCESS:
//                     List<Players>? patientappointmentList =
//                         snapshot.data!.data.players;
//                     print("data=>${snapshot.data!.data.players![0].name}");
//                     patientappointmentsearchdata = patientappointmentList;
//                     return SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                               width: 370,
//                               color: Colors.white,
//                               // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                               margin: EdgeInsets.all(15),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(0),
//                                 child: Material(
//                                   color: Colors.white,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       Expanded(
//                                         child: TextField(
//                                             controller:
//                                                 patientappointmentController,
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               color: Colors.black54,
//                                             ),
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                     "Search your player name",
//                                                 contentPadding: EdgeInsets.only(
//                                                   left: 80,
//                                                 ),
//                                                 prefixIcon: Icon(Icons.search),
//                                                 border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                         color: Colors.black54,
//                                                         width: 32.0),
//                                                     borderRadius:
//                                                         BorderRadius
//                                                             .circular(5.0)),
//                                                 focusedBorder:
//                                                     OutlineInputBorder(
//                                                         borderSide:
//                                                             BorderSide(
//                                                                 color: Colors
//                                                                     .black54,
//                                                                 width: 32.0),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     25.0))),
//                                             onChanged: onSearchTextChanged),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )),
//                           patientappointmentList!.length != 0 ||
//                                   patientappointmentController.text.isNotEmpty
//                               ? _jobsListView(patientappointmentserachlist)
//                               : _jobsListView(patientappointmentList)
//                         ],
//                       ),
//                     );
//
//                     break;
//                   case Status.ERROR:
//                     return Container();
//                 }
//               }
//               return Container();
//             }));
//   }
// }
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
import '../../constants/response.dart';
import '../homePage/navigator.dart';

List<Map<String, String>> forAddPlayers = [];

class AddPlayers extends StatefulWidget {
  AddPlayers({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers>
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
              "Add Friends",
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
              itemCount: productDetails!.length,
              itemBuilder: (context, index) {
                return
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
                            "${productDetails[index].name}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                print(productDetails[index].id);
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
                                  forAddPlayers.add({
                                    "name": productDetails[index].name!,
                                    "dp": productDetails[index].profilePic!,
                                    "id": productDetails[index].id.toString(),
                                  });
                                  Fluttertoast.showToast(msg: "Player Added");
                                  return;
                                }
                                if (flag == false) {
                                  forAddPlayers.add({
                                    "name": productDetails[index].name!,
                                    "dp": productDetails[index].profilePic!,
                                    "id": productDetails[index].id.toString(),
                                  });
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
                          TextButton(
                              onPressed: () {
                                print(forAddPlayers
                                    .contains({"name": productDetails[index].name, "dp": productDetails[index].profilePic}));
                                forAddPlayers
                                    .removeWhere((element) => element["name"] == productDetails[index].name);
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
