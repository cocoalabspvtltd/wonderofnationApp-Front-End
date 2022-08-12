import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oo/apis/bloc/add_club_bloc.dart';
import 'package:oo/apis/modelclass/add_club_modelclass.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/constants/colors.dart';

import '../apis/bloc/clublistbloc.dart';
import '../constants/response.dart';

import 'myclubs.dart';


class Addclubs extends StatefulWidget {
  const Addclubs({Key? key}) : super(key: key);

  @override
  State<Addclubs> createState() => _AddclubsState();
}

class _AddclubsState extends State<Addclubs> {
   late AddClubListBloc _bloc;

  List<AddClubModelclass> patientappointmentsearchdata = [];
  List<AddClubModelclass> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
   ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  void initState() {
    super.initState();
    _bloc =AddClubListBloc();

    setState(() {});
  }
  onSearchTextChanged(String text) async {
    patientappointmentserachlist.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    patientappointmentsearchdata.forEach((data) {
      if (data.name!.toLowerCase().contains(text) ||
          data.name!.contains(text))
        patientappointmentserachlist.add(data);
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
          return _tile(data[index].name,
             data[index].id );
        });
  }

  SizedBox _tile(
      String title,int clubid) =>
      SizedBox(
          height: 300,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/addclub.png",
                    height: 170, width: 360, fit: BoxFit.fill,),
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
                      SizedBox(
                        height: 35,
                        width: 400,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ColorConstant.green6320,
                              onPrimary: Colors.white,
                            ),
                            onPressed: (){
                              EasyLoading.show(status: 'loading...');
                              joinclubapi.getLeaveeport( context, clubid);
                              EasyLoading.dismiss();
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Myclubs()));
                            }, child: Text("Join Club")),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));



  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(95.0),
            child: Text(
              "Join",
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              iconSize: 25,
              color: Colors.black,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Myclubs()));
              }
          ),
        ),
        body: StreamBuilder<Response<List<AddClubModelclass>>>(
            stream: _bloc.addclublistDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    List<AddClubModelclass> patientappointmentList =
                        snapshot.data!.data;
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
                          patientappointmentserachlist.length != 0 ||
                              patientappointmentController.text.isNotEmpty
                              ? _jobsListView(patientappointmentserachlist)
                              : _jobsListView(patientappointmentsearchdata)
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container();
                }
              }
              return Container();
            })
    );
  }
}