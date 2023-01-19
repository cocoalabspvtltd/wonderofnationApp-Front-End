import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/follow_bloc.dart';
import 'package:oo/apis/modelclass/follow_modelclass.dart';
import 'package:oo/apis/repositories/follow_repository.dart';
import 'package:oo/constants/colors.dart';

import 'package:oo/elements/LoadMoreListener.dart';

import '../../../constants/response.dart';

class UserFollowingScreen extends StatefulWidget {
  UserFollowingScreen({
    Key? key, required this.id,
  }) : super(key: key);
final int id;
  @override
  State<UserFollowingScreen> createState() => _UserFollowingScreenState();
}

class _UserFollowingScreenState extends State<UserFollowingScreen>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  late FollowBloc _bloc;
  late ScrollController _followingScrollController;
  List<Following> followinglist = [];
  FollowRepository followapi = FollowRepository();
  void initState() {
    super.initState();
    _bloc = FollowBloc();
    _bloc.getUserfollowingList(false,widget.id);
    _followingScrollController = ScrollController();
    _followingScrollController.addListener(_scrollListener);
    setState(() {});
  }
  paginate() async{
    await _bloc.getfollowingList(true);
  }
  void _scrollListener() async {
    if (_followingScrollController.offset >=
        _followingScrollController.position.maxScrollExtent &&
        !_followingScrollController.position.outOfRange) {
      print("reach the bottom");
      // if (_bloc.hasNextPage) {
      paginate();
      //}
    }
    if (_followingScrollController.offset <=
        _followingScrollController.position.minScrollExtent &&
        !_followingScrollController.position.outOfRange) {
      print("reach the top");
    }
  }
  @override
  refresh(bool isLoading) {
    if (mounted) {
      setState(() {});
    }
  }

  TextEditingController searchcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<Response<FollowModelClass>>(
            stream: _bloc.followDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                          child: CircularProgressIndicator()),
                    );
                    break;
                  case Status.SUCCESS:
                    FollowModelClass followinglist = snapshot.data!.data;
                    print("response->${followinglist}");
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 370,
                              color: Colors.white,
                              margin: EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Material(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          controller: searchcontroller,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              prefixIcon: Icon(Icons.search),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54,
                                                      width: 32.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54,
                                                      width: 32.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      25.0))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                         followinglist.following==null?Text("${followinglist.message}"): _followingListView(followinglist),
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container(
                      child: Center(child: Text("Currently no followings")),
                    );
                }
              }
              return Container(
                child: Center(child: Text("Currently no followings")),
              );
            })
    );
  }

  Widget _followingListView(followinglist) {

    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 8,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:followinglist.following.length ,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Card(
                elevation: 0,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/user2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width *
                          0.03,
                    ),
                    Text(
                      "${followinglist.following[index].name}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "Following",
                      style: TextStyle(
                          color: ColorConstant.green6320,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width *
                          0.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
