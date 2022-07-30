

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apis/repositories/registerRepositories.dart';
import '../constants/baseurls.dart';

int Locationid = 0;
class LocationDropdown extends StatefulWidget {
  const LocationDropdown({Key? key}) : super(key: key);

  @override
  _LocationDropdownState createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  List locationItemlist = [];

  Future getAllCategory() async {


    http.Response response = await http.get(Uri.parse('${baseurl}district/list'), headers: <String, String>{
      'Accept': "appilication/json",
      'Authorization': 'Bearer $TOKEN',

    },);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        locationItemlist = jsonData;
        print("locationItemlist->${locationItemlist}");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(



            decoration: BoxDecoration(


              borderRadius: BorderRadius.circular(7),

            ),
            child:  DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: Text('Select',style: TextStyle(fontSize: 15),),
                ),

                items: locationItemlist.map((item) {
                  // int id = categoryItemlist[0]["id"];
                  // print("id->>>>>${id}");
                  return DropdownMenuItem(
                    onTap: (){setState((){
                      int id = item["id"];
                      Locationid = id;
                      print("designatioids->>>>>>${Locationid}");
                    });},
                    value: item['id'].toString(),

                    child: Text(item['name'].toString()),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    dropdownvalue = newVal;

                  });
                },
                value: dropdownvalue,
              ),
            ),
          ),
        ],
      ),

    );
  }
}