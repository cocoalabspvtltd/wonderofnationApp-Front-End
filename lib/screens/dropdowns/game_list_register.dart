import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oo/constants/user.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/base_urls.dart';


int designatioids1 = 0;
class DesignationDropDown extends StatefulWidget {
  const DesignationDropDown({Key? key}) : super(key: key);

  @override
  _DesignationDropDownState createState() => _DesignationDropDownState();
}

class _DesignationDropDownState extends State<DesignationDropDown> {
  List categoryItemlist = [];

  Future getAllCategory() async {


    http.Response response = await http.get(Uri.parse('${baseurl}get/sports'), headers: <String, String>{
      'Accept': "appilication/json",
      'Authorization': 'Bearer ${UserDetails.apiToken}',

    },);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
        print("categoryItemlist->${categoryItemlist}");
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
          Container(height: 30,width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),

            ),
            child:  DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Select',style: TextStyle(fontSize: 15),),
                ),

                items: categoryItemlist.map((item) {
                  // int id = categoryItemlist[0]["id"];
                  // print("id->>>>>${id}");
                  return DropdownMenuItem(
                    onTap: (){setState((){
                      int id = item["id"];
                      designatioids1 = id;
                      print("designatioids->>>>>>${designatioids1}");
                    });},
                    value: item['id'].toString(),

                    child: Text(item['sport'].toString()),
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