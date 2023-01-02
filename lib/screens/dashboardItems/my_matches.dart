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
  String pendingamount;
  MyMatches({Key? key, required this.fragmentToShow,required this.pendingamount}) : super(key: key);

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
        return creatingmatchesscreen(amount: widget.pendingamount,);
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