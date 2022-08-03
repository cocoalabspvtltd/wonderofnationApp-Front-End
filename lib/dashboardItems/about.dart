import 'package:flutter/material.dart';

class Aboutus_page extends StatefulWidget {
  const Aboutus_page({Key? key}) : super(key: key);

  @override
  State<Aboutus_page> createState() => _Aboutus_pageState();
}

class _Aboutus_pageState extends State<Aboutus_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 23
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text("About Us",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 28,right: 28),
                child: Container(
                    child :  Text('''
The ultimate app for Sports. Wonder of nation app connects you with sports players to enjoy playing together through unique & meaningful experiences all from our easy-to-use app. Get your initial level estimation through our sign up process and you will be ready to start playing matches straight away.
             Don’t know where to play ? Book any of our clubs courts so you can play your perfect match. Whether you pay the whole booking or you split the payment with the other players, the court will be yours.   
                 Whether you want to create a match to play with friends, make it public for others or find out active matches to join, you will have the power to play as you want. There will always be suggested matches for you to enjoy!''',
                      maxLines: 30, style: TextStyle(fontSize: 14 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                          color: Colors.black,wordSpacing:2.7, height: 1.5,letterSpacing: 0.003) ,textAlign: TextAlign.justify, )
                ),
              ),
            ]
        ),
      ),
    ),
    );

  }
}