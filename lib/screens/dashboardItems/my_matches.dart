import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/mybookingbloc.dart';
import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/elements/LoadMoreListener.dart';
import 'package:oo/screens/dashboardItems/creating_matches_screen.dart';
import 'package:oo/screens/dashboardItems/privacy.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import '../../constants/response.dart';
import '../homePage/navigator.dart';
import 'joinedmatches.dart';


class MyMatches extends StatefulWidget {
  final int fragmentToShow;
  MyMatches({Key? key, required this.fragmentToShow}) : super(key: key);

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches> with LoadMoreListener , SingleTickerProviderStateMixin {
  var selectedTabPos = 0;
  TabController? _tabController;
  late MyOrdersBlocUser _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  bool a = false;
  bool b= false;
  String mText1 = "See All";
  String mText2="See All";
  @override
  void initState() {
    print("My match Screen");
      _tabController = new TabController(vsync: this, length: 2);
      selectedTabPos = widget.fragmentToShow != null ? widget.fragmentToShow : 0;
      _tabController!.animateTo(selectedTabPos);
    _bloc = MyOrdersBlocUser(listener: this);
    _bloc.getmyplayerDetailsList(false);
    _itemsScrollController = ScrollController();
    _itemsScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  refresh(bool isLoading) {
    if (mounted) {
      setState(() {
        isLoadingMore = isLoading;
      });
    }
  }

  paginate() async {
    print('paginate');
    await _bloc.getmyplayerDetailsList(true);
  }

  void _scrollListener() async {
    if (_itemsScrollController.offset >=
        _itemsScrollController.position.maxScrollExtent &&
        !_itemsScrollController.position.outOfRange) {
      print("reach the bottom");
      // if (_bloc.hasNextPage) {
      paginate();
      //}
    }
    if (_itemsScrollController.offset <=
        _itemsScrollController.position.minScrollExtent &&
        !_itemsScrollController.position.outOfRange) {
      print("reach the top");
    }
  }

  // late bool like;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "My Matches",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        leading: GestureDetector(onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
          );
        },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            constraints: BoxConstraints.expand(height: 55),
            child: BottomAppBar(
              child: infoTabs(),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: getSubFragment(selectedTabPos),
            flex: 1,
          ),
        ],
      ),

    );
  }
  infoTabs() {
    return TabBar(
      controller: _tabController,
      onTap: tabItemClicked,
      tabs: [
        Tab(
          child: tabItem(context, 'Matches'),
        ),
        Tab(
          child: tabItem(context, 'Joined matches'),
        ),
      ],
      labelColor: ColorConstant.green6320,
      unselectedLabelColor: ColorConstant.black901,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor:  ColorConstant.green6320,
      indicatorWeight: 3,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color:ColorConstant.green6320, width: 2.0),
        insets: getIndicatorPadding(),
      ),
    );
  }

  getIndicatorPadding() {
    if (selectedTabPos == 0) {
      return EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 2.0);
    } else {
      return EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 2.0);
    }
  }

  Row tabItem(BuildContext context, var title) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            flex: 2,
          ),
        ]);
  }

  void tabItemClicked(int index) {
    if (mounted) {
      setState(() {
        selectedTabPos = index;
      });
    }
  }
  getSubFragment(int pos) {
    switch (pos) {
      case 0:
        return creatingmatchesscreen();
        break;
      case 1:
        return JoinedMatches();
        break;

      default:
        return new Center(
          child: Text("Error"),
        );
    }
  }

  // Widget _buildProductSavedListView(List<Matches> productDetails) {
  //   return  Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Text("Upcoming matches",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
  //             Spacer(),
  //             TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinedMatches()));}, child: Text("Joined Matches"))
  //           ],
  //         ),
  //
  //         SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //         Divider(color: Colors.grey,),
  //         SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //         a == true ?
  //         ListView.separated(
  //             separatorBuilder: (BuildContext context, int index) {
  //               return SizedBox(
  //                 height: 5,
  //               );
  //             },
  //             physics: BouncingScrollPhysics(),
  //             scrollDirection: Axis.vertical,
  //             itemCount: productDetails.length,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               return GestureDetector(
  //                 onTap: (){
  //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch(id: productDetails[index]!.id!,)));
  //                 },
  //                 child: Container(
  //                   child: Card(
  //                     elevation: 2,
  //                     shape: RoundedRectangleBorder(
  //                         side: BorderSide(color: Colors.green, width: 0.5),
  //                         borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     shadowColor: Colors.grey,
  //                     child: Row(
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(7.0),
  //                             bottomLeft: Radius.circular(7.0),
  //                           ),
  //                           child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
  //                             width: 90,
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(10.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
  //                               Text(
  //                                 "${productDetails[index].clubName}",
  //                                 style: new TextStyle(
  //                                     fontSize: 15.0, fontWeight: FontWeight.bold),
  //                               ),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Row(
  //                                 children: [
  //                                   Image.asset("assets/images/location.png", color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].cityName}/${productDetails[index].stateName}",
  //                                     style:  TextStyle(
  //                                         fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                 ],
  //                               ),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Text("Sport: ${productDetails[index].sport}",
  //                                 style:  TextStyle(
  //                                     fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Row(
  //                                 children: [
  //                                   Image.asset("assets/images/calender.png", color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].date}",style:  TextStyle(
  //                                       fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
  //                                   Icon(Icons.lock_clock, color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].time}",style:  TextStyle(
  //                                       fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             }
  //         )
  //             :  ListView.separated(
  //             separatorBuilder: (BuildContext context, int index) {
  //               return SizedBox(
  //                 height: 5,
  //               );
  //             },
  //             physics: BouncingScrollPhysics(),
  //             scrollDirection: Axis.vertical,
  //             itemCount:3,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               return GestureDetector(
  //                 onTap: (){
  //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch(id: productDetails[index]!.id!,)));
  //                 },
  //                 child: Container(
  //                   child: Card(
  //                     elevation: 2,
  //                     shape: RoundedRectangleBorder(
  //                         side: BorderSide(color: Colors.green, width: 0.5),
  //                         borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     shadowColor: Colors.grey,
  //                     child: Row(
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(7.0),
  //                             bottomLeft: Radius.circular(7.0),
  //                           ),
  //                           child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
  //                             width: 90,
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(10.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
  //                               Text(
  //                                 "${productDetails[index].clubName}",
  //                                 style: new TextStyle(
  //                                     fontSize: 15.0, fontWeight: FontWeight.bold),
  //                               ),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Row(
  //                                 children: [
  //                                   Image.asset("assets/images/location.png", color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].cityName}/${productDetails[index].stateName}",
  //                                     style:  TextStyle(
  //                                         fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                 ],
  //                               ),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Text("Sport: ${productDetails[index].sport}",style:  TextStyle(
  //                                   fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                               SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
  //                               Row(
  //                                 children: [
  //                                   Image.asset("assets/images/calender.png", color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].date}",style:  TextStyle(
  //                                       fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
  //                                   Icon(Icons.lock_clock, color: Colors.black,),
  //                                   SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
  //                                   Text("${productDetails[index].time}",style:  TextStyle(
  //                                       fontSize: 14.0, fontWeight: FontWeight.w500),),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             }
  //         ),
  //         SizedBox(height: 10,),
  //         InkWell(
  //           onTap: (){
  //             _visibilitymethod1();
  //           },
  //           child: Center(
  //             child: Text(
  //               mText1,
  //               style: TextStyle(color: Colors.grey),
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 10,),
  //
  //         SizedBox(height: 30,),
  //       ],
  //     ),
  //   );
  // }
  void _visibilitymethod1() {
    setState(() {
      if (a) {
        a = false;
        mText1 = "See All";
      } else {
        a = true;
        mText1 = "See hide";
      }
    });
  }
}