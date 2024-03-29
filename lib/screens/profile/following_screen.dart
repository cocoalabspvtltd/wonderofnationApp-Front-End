import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oo/apis/bloc/follow_bloc.dart';
import 'package:oo/apis/modelclass/follow_modelclass.dart';
import 'package:oo/apis/repositories/follow_repository.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/screens/addfriends/screen_for_profile_view.dart';
import '../../constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';

class FollowingScreen extends StatefulWidget {
  FollowingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  late FollowBloc _bloc;
  late ScrollController _followingScrollController;
  List<Following>? follwingsearchdata = [];
   List<Following>? followingserachlist = [];
  FollowRepository followapi = FollowRepository();
  void initState() {
    super.initState();
    _bloc = FollowBloc();
    _bloc.getfollowingList(false);
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

  onSearchTextChanged(String text) async {
    followingserachlist!.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    follwingsearchdata!.forEach((data) {
      if (data.name!.toLowerCase().contains(text) || data.name!.contains(text))
        followingserachlist?.add(data);
    });

    setState(() {});
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
                    FollowModelClass follow_list = snapshot.data!.data;
                    List<Following>? followinglist = follow_list.following;
                    follwingsearchdata = followinglist;
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
                                          onChanged: onSearchTextChanged,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          followingserachlist!.length != 0 ||
                                  searchcontroller.text.isNotEmpty
                              ? _followingListView(followingserachlist)
                              : _followingListView(followinglist)
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
              return Align(
                alignment: AlignmentDirectional.topCenter,
                child: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: CircularProgressIndicator()),
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
        itemCount:followinglist.length ,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProfileView(id: followinglist.following[index].id,)),
                );
              },
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
                        "${followinglist[index].name}",
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
            ),
          );
        });
  }
}
