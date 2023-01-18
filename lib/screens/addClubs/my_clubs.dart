import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/joined_club_bloc.dart';
import 'package:oo/apis/repositories/joined_clublist.dart';

import '../../apis/modelclass/joined_club_Model.dart';
import '../../constants/response.dart';
import '../homePage/navigator.dart';

import 'add_clubs.dart';



class MyClubs extends StatefulWidget {
  const MyClubs({Key? key}) : super(key: key);

  @override
  State<MyClubs> createState() => _MyClubsState();
}

class _MyClubsState extends State<MyClubs> {
  late MyClubDetailsBloc _bloc;

  List<JoinedClubModel> JoinedClubsearchdata = [];
  List<JoinedClubModel> JoinedClubserachlist = [];
  TextEditingController JoinedClubController = TextEditingController();
  MyClubRepository joinclubapi = MyClubRepository();
  void initState() {
    super.initState();
    _bloc = MyClubDetailsBloc();

    setState(() {});
  }
  onSearchTextChanged(String text) async {
    JoinedClubserachlist.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    JoinedClubsearchdata.forEach((data) {
      if (data.name!.toLowerCase().contains(text) ||
          data.name!.contains(text))
        JoinedClubserachlist.add(data);
    });

    setState(() {});
  }
  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data.length}");
          return _tile(data[index].name, data[index].email,
            data[index].id,data[index].img );
        });
  }
  SizedBox _tile(
      String title, String subtitle,  int clubid,String image) =>
  SizedBox(height: 300,
  child: Card(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset("assets/images/myclubimg.png",
            height: 170, width: 360, fit: BoxFit.fitWidth,),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize:
            MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("${title}", textAlign:
                  TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 7,),
                  Icon(Icons.location_on_outlined, size: 13),
                  SizedBox(width: 3,),
                  Text("Kochi,Ernakulam,Kerala", style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),),
                  SizedBox(width: 160,),
                  Text("5 Km", style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),),
                  SizedBox(width: 7,),
                ],
              ),
              SizedBox(height: 7,),
            ],
          ),
        )
      ],
    ),
  ),
  );

  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
              "My clubs",
              style: TextStyle(color: Colors.black,fontSize: 15),
            )),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddClubs()));
            },
          ),
        ],
      ),
    body:    StreamBuilder<Response>(
            stream: _bloc.MyClubDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    var patientappointmentList =
                        snapshot.data!.data;
                    JoinedClubsearchdata = patientappointmentList;
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
                                            JoinedClubController,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            decoration: InputDecoration(
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
                          JoinedClubserachlist.length != 0 ||
                              JoinedClubController.text.isNotEmpty
                              ? _jobsListView(JoinedClubserachlist)
                              : _jobsListView(JoinedClubsearchdata)
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container(
                      child: Center(child: Text("Currently no clubs added")),
                    );
                }
              }
              return Container(
                child: Center(child: Text("Currently no clubs added")),
              );
            })
    );
  }
}