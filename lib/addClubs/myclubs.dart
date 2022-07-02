import 'package:flutter/material.dart';

import '../homePage/navigator.dart';
import 'addclubs.dart';


class Myclubs extends StatefulWidget {
  const Myclubs({Key? key}) : super(key: key);

  @override
  State<Myclubs> createState() => _MyclubsState();
}

class _MyclubsState extends State<Myclubs> {
  @override
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Addclubs()));
            },
          ),
        ],
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
                      padding: const EdgeInsets.only
                        (top: 10.0),
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
      ),
    );
  }
}