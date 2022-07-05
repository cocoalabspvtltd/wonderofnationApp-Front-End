import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
int marketids = 0;
String marketname = "";
String MarketSelection = "";
class newmarketdropdropdmnDetails {


  final int id;
  final String sport;

  newmarketdropdropdmnDetails(this.id, this.sport);

  newmarketdropdropdmnDetails.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        sport = jsonMap['sport'];
  Map toMapData(){
    var mapGroup = new Map<String, dynamic>();
    mapGroup["name"] = id;
    mapGroup['_id'] = sport;
    return mapGroup;

  }
}



class Marketdropdown extends StatefulWidget {
  @override
  _MyHomePageState15 createState() => _MyHomePageState15();
}

class _MyHomePageState15 extends State<Marketdropdown> {
  String dropdownvalue = 'Select';
  String marketypessss = "";
  var items = ["fgh"];
  int id = 0;
  late final Function()? onChanged;

  @override
  Future _fetchJobs() async {


    final response = await  http.get(
      Uri.parse(
          'https://68ea-59-98-48-61.ngrok.io/api/create'),
      headers: <String, String>{
        "accept": "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      print(jsonResponse);
      return jsonResponse
          .map((job) => new newmarketdropdropdmnDetails.fromJson(job))
          .toList();
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
              print("holooo${snapshot.data}");
              if (snapshot.hasData) {
                var newmarketagentid = snapshot.data as List<newmarketdropdropdmnDetails>?;
                print("dataedfghjk->>>>>>${newmarketagentid}");
                if (MarketSelection == "") {
                  MarketSelection = newmarketagentid![0].sport;
                }
                else{
                  MarketSelection = MarketSelection;
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


                            items: newmarketagentid!.map((items) {
                              return DropdownMenuItem(
                                  onTap: (){setState((){
                                    id = items.id;
                                    marketids = id;
                                    marketypessss = items.sport;
                                    marketname = marketypessss;

                                    print("id->>>>>>${marketypessss}");
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
                            value: MarketSelection,
                            onChanged: (newValue) {
                              setState(() {
                                MarketSelection = newValue as String;
                                print("MySelection->>>>>>${MarketSelection}");
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

