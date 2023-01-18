import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oo/apis/modelclass/user_suggestion_model.dart';
import 'package:oo/apis/repositories/user_suggestion_repositories.dart';
import 'package:oo/constants/commonapierror.dart';
import '../../apis/bloc/user_suggestion_bloc.dart';
import '../../apis/repositories/followunfollowusers.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/response.dart';

class HomeItemWidget extends StatefulWidget {
  const HomeItemWidget({Key? key}) : super(key: key);

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  late UserSuggestionDetailsBloc _bloc;
  late ScrollController _itemsScrollController;
  bool isLoadingMore = false;
 late UserSuggestionModel JoinedClubsearchdata;
  List<UserSuggestionModel> JoinedClubserachlist = [];
  TextEditingController JoinedClubController = TextEditingController();
  UserSuggestionRepository joinclubapi = UserSuggestionRepository();
  FollowRepositories followapi = FollowRepositories();
  FollowRepositories unFollowapi = FollowRepositories();
  void initState() {
    super.initState();
       _bloc = UserSuggestionDetailsBloc( );
        _itemsScrollController = ScrollController();
        _bloc.getmyordersDetailsList(false);
    setState(() {});
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
var buttonText = "Follow";
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount:data.length,
        itemBuilder: (context, index) {

          return _tile(
            data[index].name,
            data[index].id,data[index].followStatus
          );
        });
  }

  SizedBox _tile(
    String title,
      int id,
      int follow_status
  ) =>
      SizedBox(
        height: 300,
        child: IntrinsicWidth(
          child: Container(
            height: getSize(
              51.00,
            ),
            width: getSize(
              115.00,
            ),
            margin: EdgeInsets.only(
              right: getHorizontalSize(
                9.00,
              ),
            ),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  10.00,
                ),
              ),
              border: Border.all(
                color: ColorConstant.black900,
                width: getHorizontalSize(
                  1.00,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        0.00,
                      ),


                      top: getVerticalSize(
                        19.00,
                      ),
                      right: getHorizontalSize(
                        1.00,
                      ),
                    ),
                    child: Icon(Icons.account_box_outlined)),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      14.00,
                    ),
                    top: getVerticalSize(
                      13.00,
                    ),
                    right: getHorizontalSize(
                      14.00,
                    ),
                  ),
                  child: Text(
                    "${title}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: getFontSize(
                        12,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      14.00,
                    ),
                    top: getVerticalSize(
                      11.00,
                    ),
                    right: getHorizontalSize(
                      14.00,
                    ),
                    bottom: getVerticalSize(
                      16.00,
                    ),
                  ),
                  child:

                  GestureDetector(
                    onTap: () async{
                      await follow_status == 0?followapi.doFollow(id):unFollowapi.doUnFollow(id);


                      setState(() {
                        followMessage =
                        followMessage == "Follow" ? "Unfollow" : "Follow";
                      });

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getVerticalSize(
                        37.00,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: follow_status == 0 ? ColorConstant.green6320: Colors.white10,
                          borderRadius: BorderRadius.circular(18.50),
                          border: Border.all(
                            color: follow_status == 1 ? Colors.white : Colors.black,
                          )
                      ),
                      child: follow_status==0?Text("Follow",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: follow_status == 0 ? Colors.white : Colors.black,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.36,
                        ),
                      ):Text("UnFollow",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: follow_status == 0 ? Colors.white : Colors.black,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.36,
                        ),
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<Response<UserSuggestionModel>>(
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
                UserSuggestionModel resp = snapshot.data!.data;
                return _bloc.myResultdetails.isEmpty
                    ? SizedBox(
                  height: MediaQuery.of(context).size.height - 180,
                  child: CommonApiResultsEmptyWidget(
                      "${resp.success!}",
                      textColorReceived: Colors.black),
                )
                    : _jobsListView(
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
        });
  }
}

class NearYou extends StatefulWidget {
  const NearYou({Key? key}) : super(key: key);

  @override
  State<NearYou> createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getHorizontalSize(
                224.00,
              ),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      15.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      15.00,
                    ),
                  ),
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
                  bottomRight: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.black9000f,
                    spreadRadius: getHorizontalSize(
                      2.00,
                    ),
                    blurRadius: getHorizontalSize(
                      2.00,
                    ),
                    offset: Offset(
                      4,
                      0,
                    ),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: getVerticalSize(
                        190.00,
                      ),
                      width: getHorizontalSize(
                        320.00,
                      ),
                      margin: EdgeInsets.only(
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        color: ColorConstant.black900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            ),
                            topRight: Radius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            ),
                            bottomLeft: Radius.circular(
                              getHorizontalSize(
                                0.00,
                              ),
                            ),
                            bottomRight: Radius.circular(
                              getHorizontalSize(
                                0.00,
                              ),
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                "assets/images/seasonalchampionship.png",
                                height: getVerticalSize(
                                  190.00,
                                ),
                                width: getHorizontalSize(
                                  320.00,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    20.00,
                                  ),
                                  top: getVerticalSize(
                                    35.00,
                                  ),
                                  right: getHorizontalSize(
                                    50.00,
                                  ),
                                  bottom: getVerticalSize(
                                    20.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getHorizontalSize(
                                        140.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Friendly Match",
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            22,
                                          ),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          20.00,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: getVerticalSize(
                                                13.00,
                                              ),
                                            ),
                                            child: Container(
                                                height: getSize(
                                                  15.00,
                                                ),
                                                width: getSize(
                                                  20.00,
                                                ),
                                                child: Image.asset(
                                                    "assets/images/location.png")),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Club Name/ Sports Center",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    13,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: getVerticalSize(
                                                    0.00,
                                                  ),
                                                  right: getHorizontalSize(
                                                    9.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  "3.5 km away",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      10,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  6.00,
                ),
                bottom: getVerticalSize(
                  17.00,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        15.00,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: getVerticalSize(
                            25.00,
                          ),
                          width: getHorizontalSize(
                            56.00,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: getHorizontalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      getSize(
                                        12.50,
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/user1.png",
                                      height: getSize(
                                        25.00,
                                      ),
                                      width: getSize(
                                        25.00,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      15.00,
                                    ),
                                    right: getHorizontalSize(
                                      16.00,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      getSize(
                                        12.50,
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/user2.png",
                                      height: getSize(
                                        25.00,
                                      ),
                                      width: getSize(
                                        25.00,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      getSize(
                                        12.50,
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/user3.png",
                                      height: getSize(
                                        25.00,
                                      ),
                                      width: getSize(
                                        25.00,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              5.00,
                            ),
                            top: getVerticalSize(
                              5.00,
                            ),
                            bottom: getVerticalSize(
                              5.00,
                            ),
                          ),
                          child: Text(
                            "and 2 more",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        5.00,
                      ),
                      left: getHorizontalSize(
                        25.00,
                      ),
                      bottom: getVerticalSize(
                        5.00,
                      ),
                    ),
                    child: Text(
                      "Fee: ₹500",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstant.green6320,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
