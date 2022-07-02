import 'package:flutter/material.dart';

import 'myclubs.dart';


class Addclubs extends StatefulWidget {
  const Addclubs({Key? key}) : super(key: key);

  @override
  State<Addclubs> createState() => _AddclubsState();
}

class _AddclubsState extends State<Addclubs> {
  @override
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(13.0),
                      borderSide: new BorderSide(),
                    ),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
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
                                        child: Text("Football Club", textAlign:
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
                                            primary: Colors.deepOrange,
                                            onPrimary: Colors.white,
                                          ),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Myclubs()));
                                          }, child: Text("Add Club")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ]),
          ),
        )
    );
  }
}