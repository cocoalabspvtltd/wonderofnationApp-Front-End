


import 'package:flutter/material.dart';

import '../Event/Events.dart';

import '../matches/club_list_joining.dart';
import '../matches/match_home.dart';
import '../profile/profile_page.dart';

import '../profile/profile_ui.dart';
import 'home_page1.dart';



class NavigatorItem {
  final String label;
  final int index;

  final  screen;
  final ICON;




  NavigatorItem(this.label, this.index, this.screen,this
      .ICON);
}
List  <NavigatorItem>  navigatorItems = [

  NavigatorItem("Home", 0, HomePage(RegisterName: '',),Icon(Icons.home_outlined,),),
  NavigatorItem(
      "Events", 1, events(),Icon(Icons.event_available,)),
  NavigatorItem("Match",  2, ClubList(),Icon(Icons.add_card_outlined,)),

  NavigatorItem("Profile",  3, ProfileUi(),Icon(Icons.account_box_outlined,)),

  // NavigatorItem("Account", "assets/icons/account_icon.svg", 4, Cus_id == null?LoginPage():AccountScreen(),0),
];
