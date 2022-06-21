


import 'package:flutter/material.dart';

import '../profile/profileui.dart';
import 'homepage1.dart';



class NavigatorItem {
  final String label;
  final int index;

  final  screen;
  final ICON;




  NavigatorItem(this.label, this.index, this.screen,this
      .ICON);
}
List  <NavigatorItem>  navigatorItems = [

  NavigatorItem("Home", 0, HomePage(),Icon(Icons.home_outlined,color: Colors.orange,),),
  NavigatorItem(
      "Events", 1, HomePage(),Image.asset("assets/images/event.png")),
  NavigatorItem("Match",  2, HomePage(),Image.asset("assets/images/messagebox.png")),

  NavigatorItem("Profile",  3, ProfilrScreen(),Image.asset("assets/images/userpin.png")),

  // NavigatorItem("Account", "assets/icons/account_icon.svg", 4, Cus_id == null?LoginPage():AccountScreen(),0),
];
