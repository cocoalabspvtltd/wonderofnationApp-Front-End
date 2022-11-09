import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  TextEditingController searchcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 23
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("FAQ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: TextFormField(
              //     controller: searchcontroller,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       contentPadding:  EdgeInsets.symmetric(vertical: 0.1, horizontal: 3.0),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(4.0),
              //           borderSide: BorderSide(
              //             color: Colors.grey,
              //           )
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(4.0),
              //         borderSide: BorderSide(
              //           color:Colors.grey,
              //         ),
              //       ),
              //       hintText: 'Search',
              //       prefixIcon: Icon(Icons.search,color: Colors.grey,),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right:140,top: 10 ),
              //   child: Text("Commonly searched FAQ",style: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40,right: 26),
              //   child: Text('How to manage your account in WON App ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25,right: 70),
              //   child: Text('How reservation works in WON App ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25,right: 43),
              //   child: Text('How to book a court in specific location ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25,right: 132),
              //   child: Text('How to delete my account ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25,right: 90),
              //   child: Text('How to change my personal info ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25,right: 75),
              //   child: Text('How to register a credit/ debit card ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
              //     color: Colors.black,)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Divider(
              //     thickness: 0.3,
              //     color: Colors.grey[300],
              //   ),
              // ),
              ExpansionTile(
                title: Text(
                  "Question",
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      "Answer",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          height: 1.8,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              // ExpansionTile(
              //   title: Text(
              //     "Question",
              //     style: TextStyle(
              //         fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black),
              //   ),
              //   children: <Widget>[
              //     Container(
              //       padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              //       alignment: FractionalOffset.centerLeft,
              //       child: Column(
              //         children: [
              //           Text("Answer1",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 13.0,
              //                 height: 1.8,
              //                 color: Colors.black),
              //           ),
              //           Text("Answer2",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 13.0,
              //                 height: 1.8,
              //                 color: Colors.black),
              //           ),
              //           Text("Answer3",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 13.0,
              //                 height: 1.8,
              //                 color: Colors.black),
              //           ),
              //           Text("Answer4",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 13.0,
              //                 height: 1.8,
              //                 color: Colors.black),
              //           ),
              //           Text("Answer5",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 13.0,
              //                 height: 1.8,
              //                 color: Colors.black),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ]
        ),
      ),
    ),
    );
  }
}