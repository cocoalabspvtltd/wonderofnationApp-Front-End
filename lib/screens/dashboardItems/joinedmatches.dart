import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/mybookingbloc.dart';
import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/elements/LoadMoreListener.dart';
import 'package:oo/screens/dashboardItems/past_matches.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import '../../constants/response.dart';
import '../homePage/navigator.dart';


class JoinedMatches extends StatefulWidget {
  const JoinedMatches({Key? key}) : super(key: key);

  @override
  State<JoinedMatches> createState() => _JoinedMatchesState();
}

class _JoinedMatchesState extends State<JoinedMatches> with LoadMoreListener {
  late MyOrdersBlocUser1 _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  bool a = false;
  bool b= false;
  String mText1 = "See All";
  String mText2="See All";
  @override
  void initState() {
    print("My match Screen");
    _bloc = MyOrdersBlocUser1(listener: this);
    _bloc.getmyordersDetailsList(false);
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
  int matchvalue = 1;
  paginate() async {
    print('paginate');
    await _bloc.getmyordersDetailsList(true);
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
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.white,
        onRefresh: () {
          return _bloc.getmyordersDetailsList(false);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<Response<AddPlayersModel>>(
              stream: _bloc.myordersDetailsListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status!) {
                    case Status.LOADING:
                      return Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.height * 0.05, child: CircularProgressIndicator()),
                      );
                    case Status.COMPLETED:
                      AddPlayersModel resp = snapshot.data!.data;
                      return _bloc.myordersDetailsList.isEmpty
                          ? SizedBox(
                        height: MediaQuery.of(context).size.height - 180,
                        child: CommonApiResultsEmptyWidget(
                            "${resp.success!}",
                            textColorReceived: Colors.black),
                      )
                          : _buildProductSavedListView(_bloc.myordersDetailsList);
                    case Status.ERROR:
                      return CommonApiResultsEmptyWidget(
                          "${snapshot.data!.message!}",
                          textColorReceived: Colors.black);
                  }
                }
                return Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05, child: CircularProgressIndicator()),
                );
              }),
        ),
      ),
    );
  }

  Widget _buildProductSavedListView(List<Matches> productDetails) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming matches",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
          Divider(color: Colors.grey,),
          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
          a == true ?
          ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: productDetails.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch(id: productDetails[index]!.id!,)));
                  },
                  child: Container(
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      shadowColor: Colors.grey,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7.0),
                              bottomLeft: Radius.circular(7.0),
                            ),
                            child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
                              width: 90,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                                Text(
                                  "${productDetails[index].clubName}",
                                  style: new TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/location.png", color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].cityName}/${productDetails[index].stateName}",
                                      style:  TextStyle(
                                          fontSize: 14.0, fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Text("Sport: ${productDetails[index].sport}",
                                  style:  TextStyle(
                                      fontSize: 14.0, fontWeight: FontWeight.w500),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/calender.png", color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].date}",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                    Icon(Icons.lock_clock, color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].time}",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          )
              :  ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount:3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcomingmatch(id: productDetails[index]!.id!,)));
                  },
                  child: Container(
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      shadowColor: Colors.grey,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7.0),
                              bottomLeft: Radius.circular(7.0),
                            ),
                            child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fitHeight,height: 150,
                              width: 90,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height:MediaQuery.of(context).size.height * 0.00,),
                                Text(
                                  "${productDetails[index].clubName}",
                                  style: new TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/location.png", color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].cityName}/${productDetails[index].stateName}",
                                      style:  TextStyle(
                                          fontSize: 14.0, fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Text("Sport: ${productDetails[index].sport}",style:  TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.w500),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/calender.png", color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].date}",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                    Icon(Icons.lock_clock, color: Colors.black,),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                                    Text("${productDetails[index].time}",style:  TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
          SizedBox(height: 10,),

          SizedBox(height: 30,),
        ],
      ),
    );
  }
  void _visibilitymethod2() {
    setState(() {
      if (b) {
        b = false;
        mText2 = "See All";
      } else {
        b= true;
        mText2 = "See hide";
      }
    });
  }
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