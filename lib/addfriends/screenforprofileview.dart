
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileview extends StatefulWidget {
  const Profileview({Key? key}) : super(key: key);

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        leading: Center(child: Text("X",style: TextStyle(color: Colors.black),)),
        title: Padding(padding:EdgeInsets.only(left: 297),
            child: Image.asset("assets/images/menudots.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Center(child: Padding(
             padding: const EdgeInsets.only(top: 28.0),
             child: Image.asset("assets/images/profileimage.png"),
           ),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text("UserName",style: TextStyle(fontWeight: FontWeight.bold),),
            )
            ,
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Text("Professional Tennis Player",style: TextStyle(),),
            )
            ,
            // Padding(
            //   padding: const EdgeInsets.only(top: 28.0),
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 18.0),
            //     child: Text("Professional Tennis Player gfsgfdahdh ghgsg dsagfgd safgasgdg gsdf",style: TextStyle(),),
            //   ),
            // )
            // ,
          ],
        ),
      ),
    );
  }
}
