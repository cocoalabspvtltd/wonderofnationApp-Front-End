


import 'package:flutter/material.dart';

import '../Event/Events.dart';
import '../apis/repositories/registerRepositories.dart';
import '../matches/matchhome.dart';
import '../profile/profiletest.dart';
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

  NavigatorItem("Home", 0, HomePage(),Icon(Icons.home_outlined,),),
  NavigatorItem(
      "Events", 1, events(),Icon(Icons.event_available,)),
  NavigatorItem("Match",  2, Matchhome(),Icon(Icons.add_card_outlined,)),

  NavigatorItem("Profile",  3, profileui(),Icon(Icons.account_box_outlined,)),

  // NavigatorItem("Account", "assets/icons/account_icon.svg", 4, Cus_id == null?LoginPage():AccountScreen(),0),
];
