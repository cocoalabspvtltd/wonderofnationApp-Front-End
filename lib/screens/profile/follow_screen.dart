import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/follow_bloc.dart';
import 'package:oo/apis/bloc/user_suggestion_bloc.dart';
import 'package:oo/apis/modelclass/follow_modelclass.dart';
import 'package:oo/apis/modelclass/user_suggestion_model.dart';
import 'package:oo/apis/repositories/follow_repository.dart';
import 'package:oo/apis/repositories/followunfollowusers.dart';
import 'package:oo/apis/repositories/user_suggestion_repositories.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/elements/LoadMoreListener.dart';

import '../addfriends/screen_for_profile_view.dart';

class FollowScreen extends StatefulWidget {
  FollowScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  late FollowBloc _bloc;
  late ScrollController _followersScrollController;
  List<Followers> followinglist = [];
  FollowRepository followapi = FollowRepository();
  late UserSuggestionDetailsBloc _bloc1;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
  late UserSuggestionModel JoinedClubsearchdata;
  List<UserSuggestionModel> JoinedClubserachlist = [];
  TextEditingController JoinedClubController = TextEditingController();
  UserSuggestionRepository joinclubapi = UserSuggestionRepository();
  FollowRepositories suggestionfollowapi = FollowRepositories();
  FollowRepositories suggestionunFollowapi = FollowRepositories();
  void initState() {
    super.initState();
    _bloc = FollowBloc();
    _bloc.getfollowersList(false);
    _followersScrollController = ScrollController();
    _followersScrollController.addListener(_scrollListener);
    _bloc1 = UserSuggestionDetailsBloc( );
    _itemsScrollController = ScrollController();
    _bloc1.getmyordersDetailsList(false);
    setState(() {});
  }
  paginate1() async {
    print('paginate');
    await _bloc1.getmyordersDetailsList(true);
  }

  void _scrollListener1() async {
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
  paginate() async {
    await _bloc.getfollowersList(true);
  }

  void _scrollListener() async {
    if (_followersScrollController.offset >=
        _followersScrollController.position.maxScrollExtent &&
        !_followersScrollController.position.outOfRange) {
      print("reach the bottom");
      // if (_bloc.hasNextPage) {
      paginate();
      //}
    }
    if (_followersScrollController.offset <=
        _followersScrollController.position.minScrollExtent &&
        !_followersScrollController.position.outOfRange) {
      print("reach the top");
    }
  }

  @override
  refresh(bool isLoading) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<Response<FollowModelClass>>(
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
                      FollowModelClass followerslist = snapshot.data!.data;
                      print("response->${followerslist}");
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("All Followers",
                                          style: TextStyle(fontWeight: FontWeight.w500))),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  followerslist.followers==null?Text("${followerslist.message}"):
                                 _followerslist(followerslist),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Suggested for you",
                                          style: TextStyle(fontWeight: FontWeight.w500))),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      break;
                    case Status.ERROR:
                      return Container(
                        child: Center(child: Text("Currently no data")),
                      );
                  }
                }
                return Container(
                  child: Center(child: Text("")),
                );
              }),
          SingleChildScrollView(
            child: StreamBuilder<Response<UserSuggestionModel>>(
                stream: _bloc1.myordersDetailsListStream,
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
                        UserSuggestionModel resp = snapshot.data!.data;
                        return _bloc1.myResultdetails.isEmpty
                            ? SizedBox(
                          height: MediaQuery.of(context).size.height - 180,
                          child: CommonApiResultsEmptyWidget(
                              "${resp.success!}",
                              textColorReceived: Colors.black),
                        )
                            : _suggestedlist(
                            _bloc1.myResultdetails);
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
            ],
          ),
        )

    );
  }

  Widget _followerslist(followerlist) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: 8,
            ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: followerlist.followers.length,
        itemBuilder: (context, index) {
          print("----------->list${followerlist.followers}");
          return Container(
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
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Text(
                    "${followerlist.followers[index]..name}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black45),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () {},
                      child: Text(
                        "Remove",
                        style: TextStyle(color: ColorConstant.whiteA700),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _suggestedlist(data){
    return
      ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
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
                      width:
                      MediaQuery.of(context).size.width * 0.03,
                    ),
                    GestureDetector(onTap: (){
print("id->${data[index].id}");
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ProfileView(id: data[index].id,)),

                    );
                      },
                      child: Text(
                        "${data[index].name}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(
                              ColorConstant.green6320),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () async{
                          await data[index].followStatus == 0?suggestionfollowapi.doFollow(data[index].id):suggestionunFollowapi.doUnFollow(data[index].id);
                          // followMessage== "sucess"?  EasyLoading.show(status: 'loading...'):EasyLoading.dismiss();
                          setState(() {
                            followMessage =
                            followMessage == "Follow" ? "Unfollow" : "Follow";
                          });

                        },
                        child:data[index].followStatus==0?Text("Follow",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: data[index].followStatus == 0 ? Colors.white : Colors.black,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.36,
                          ),
                        ):Text("UnFollow",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: data[index].followStatus == 0 ? Colors.white : Colors.white,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.36,
                          ),
                        ),),
                    SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.0,
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
