//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../apis/bloc/gamebloc.dart';
// import '../apis/modelclass/sportmodel.dart';
// import '../constants/response.dart';
// String MySelectiondose = "";
// class MedicineDoseDropDown extends StatefulWidget {
//   const MedicineDoseDropDown({
//     Key? key,
//   }) : super(key: key);
//
//   // final appointemtdateDetaisID;
//
//   @override
//   _MedicineDoseDropDownState createState() => _MedicineDoseDropDownState();
// }
//
// class _MedicineDoseDropDownState extends State<MedicineDoseDropDown> {
//   @override
//   late AppointmentMeasurmentDetailsBloc _bloc;
//   late AppointementmeasurmentModel appointmentdatedetailslist;
//   late List<AppointementmeasurmentModel> prescriptionmeasuermentlist;
//   List<AppointementmeasurmentModel> medicinemeasurmentlist = [];
//
//   void initState() {
//     super.initState();
//     _bloc = AppointmentMeasurmentDetailsBloc();
//     setState(() {});
//   }
//
//   int id = 0;
//
//   int prescriptionid = 0;
//
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//
//     return StreamBuilder<Response<List<AppointementmeasurmentModel>>>(
//         stream: _bloc.appointmentmeasurmentDetailsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             switch (snapshot.data!.status) {
//               case Status.LOADING:
//                 return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
//                 break;
//               case Status.SUCCESS:
//                 prescriptionmeasuermentlist = snapshot.data!.data;
//                 if (MySelectiondose == "") {
//                   Text(
//                     "${MySelectiondose = prescriptionmeasuermentlist[0].sport!}",
//                     style: TextStyle(color: Colors.black),
//                   );
//                   print("MySElecgt->>>>>>>>>${MySelectiondose}");
//                 } else {
//                   MySelectiondose = MySelectiondose;
//                 }
//                 return SingleChildScrollView(
//                   child: StatefulBuilder(builder: (context, setState) {
//                     return Column(children: [
//                       Container(
//                         height: 40,
//                         // margin: EdgeInsets.only(top: 30, left: 10),
//                         width: 140,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5.0),
//                           border: Border.all(
//                               color: Colors.green,
//                               style: BorderStyle.solid,
//                               width: 2.00),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton(
//                             dropdownColor: Colors.grey,
//                             hint: Text("Select"),
//                             value: MySelectiondose,
//                             items: prescriptionmeasuermentlist.map((items) {
//                               return DropdownMenuItem(
//                                   onTap: () {
//                                     setState(() {
//                                       id = items.id!;
//                                       medicinemeasurmentlist.add(items);
//
//                                       prescriptionid = id;
//
//                                       print("prescriptionid->>>>>>${prescriptionid}");
//                                     });
//                                   },
//                                   value: items.sport,
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Text(
//                                         " ${items.sport!}",
//                                         style: TextStyle(
//                                             color: Colors.black, fontSize: 15),
//                                       ),
//                                     ],
//                                   ));
//                             }).toList(),
//                             onChanged: (newValue) {
//                               setState(() {
//                                 MySelectiondose = newValue as String;
//                                 print("MySelection->>>>>>${MySelectiondose}");
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ]);
//                   }),
//                 );
//                 break;
//               case Status.ERROR:
//                 return Container(
//                   color: Colors.yellow,
//                 );
//             }
//           }
//           return Container(color: Colors.red,);
//         });
//   }
// }
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../apis/repositories/registerRepositories.dart';
import '../constants/baseurls.dart';
int designatioids = 0;
String marketname = "";
String MySelectionemployee = "";
class newdesignationdropdropdmnDetails {


  final int id;
  final String sport;

  newdesignationdropdropdmnDetails(this.id, this.sport);

  newdesignationdropdropdmnDetails.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        sport = jsonMap['sport'];
  Map toMapData(){
    var mapGroup = new Map<String, dynamic>();
    mapGroup["sport"] = sport;
    mapGroup['id'] = id;
    return mapGroup;

  }
}



class designationdropdown extends StatefulWidget {
  @override
  _MyHomePageState15 createState() => _MyHomePageState15();
}

class _MyHomePageState15 extends State<designationdropdown> {
  String dropdownvalue = 'Select';
  String marketypessss = "";

  int id = 0;
  late final Function()? onChanged;

  @override
  Future _fetchJobs() async {


    final response = await  http.get(
      Uri.parse(
          '${baseurl}get/sports'),
      headers: <String, String>{
        'Accept': "appilication/json",
        'Authorization': 'Bearer $TOKEN',

      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      print("jsonResponse->>>>>>>>${jsonResponse}");
      return newdesignationdropdropdmnDetails.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }



  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: FutureBuilder(
            future: _fetchJobs(),
            builder: (context, snapshot) {
              print("holooo->>>>>${snapshot.data}");
              if (snapshot.hasData) {
     var newbookingagentid = snapshot.data! as List<newdesignationdropdropdmnDetails> ;
                print("dataedfghjk->>>>>>${newbookingagentid}");
                if (MySelectionemployee == "") {
                  MySelectionemployee = newbookingagentid![0].sport ;
                  print("dataedfghjk->>>>>>${MySelectionemployee}");
                }




                else{
                  MySelectionemployee = MySelectionemployee;
                }

                return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(

                        height: 60,

                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(7),

                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: MySelectionemployee,

                            items: newbookingagentid!.map((items) {
                              return DropdownMenuItem(
                                  onTap: (){setState((){
                                    id = items.id;
                                    designatioids = id;


                                    print("designatioids->>>>>>${designatioids}");
                                  });},

                                  value: items.sport,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Text(
                                        items.sport,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                MySelectionemployee = newValue as String;
                                print("MySelection->>>>>>${MySelectionemployee}");
                              });
                            },
                          ),
                        ),
                      );
                    }
                );
              }else{
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.green,
                      ),
                    ));
              }
            }


        ));


  }



}
