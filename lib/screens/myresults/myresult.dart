import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/mybookingbloc.dart';
import 'package:oo/apis/modelclass/ResultModel.dart';
import 'package:oo/apis/modelclass/mybookingmodel.dart';
import 'package:oo/apis/repositories/payment.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/elements/LoadMoreListener.dart';
import 'package:oo/screens/dashboardItems/privacy.dart';
import 'package:oo/screens/dashboardItems/resultupdation.dart';
import 'package:oo/screens/dashboardItems/upcoming_mathches.dart';
import '../../constants/response.dart';
import '../homePage/navigator.dart';


class MyResultScreen extends StatefulWidget {
  MyResultScreen({Key? key, required}) : super(key: key);
// String amount;
// String nopaycount;
@override
State<MyResultScreen> createState() => _MyResultScreenState();
}

class _MyResultScreenState extends State<MyResultScreen> with LoadMoreListener {
  late ResultBloc _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  bool a = false;
  bool b = false;
  String mText1 = "See All";
  String mText2 = "See All";

  @override
  void initState() {
    print("My history");
    _bloc = ResultBloc(listener: this);
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashBoard(UserName1: '')));
            }
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100 ),
          child: Text(
            "Results", style: TextStyle(color: Colors.black, fontSize: 15),),
        ),),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.white,
        onRefresh: () {
          return _bloc.getmyordersDetailsList(false);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<Response<ResultModelClass>>(
              stream: _bloc.myordersDetailsListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status!) {
                    case Status.LOADING:
                      return Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.height * 0.05,
                            child: CircularProgressIndicator()),
                      );
                    case Status.COMPLETED:
                      ResultModelClass resp = snapshot.data!.data;
                      return _bloc.myResultdetails.isEmpty
                          ? SizedBox(
                        height: MediaQuery.of(context).size.height - 180,
                        child: CommonApiResultsEmptyWidget(
                            "${resp.success!}",
                            textColorReceived: Colors.black),
                      )
                          : _buildProductSavedListView(
                          _bloc.myResultdetails);
                    case Status.ERROR:
                      return CommonApiResultsEmptyWidget(
                          "${snapshot.data!.message!}",
                          textColorReceived: Colors.black);
                  }
                }
                return Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                      child: CircularProgressIndicator()),
                );
              }),
        ),
      ),
    );
  }

  Widget _buildProductSavedListView(List<Results> resultDetails) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: resultDetails.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.65,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0,),
                                  child: Text(
                                    "${resultDetails[index].clubName}",
                                    style: new TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10,),
                                    Image.asset(
                                      "assets/images/location.png",
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5,),
                                    Text("${resultDetails[index].cityName}/${resultDetails[index].stateName}"),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 33,),
                                    Text("2.5 km away"),
                                    SizedBox(width: 10,),
                                    Image.asset(
                                      "assets/images/calender.png",
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 8,),
                                    Text("${resultDetails[index].date}"),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:3),
                        child: Container(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.23,
                          decoration: BoxDecoration(
                              color:resultDetails[index].winStatus==1? Colors.green[900]:Colors.red[900],
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Center(child: Text("${resultDetails[index].winStatus==0?"Lost":"Won"}",style: TextStyle(color: Colors.white),)),
                        ),
                      ),

                    ],
                  ),
                );

              }),
        ],
      ),
    );
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
