
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/usersuggestionmodel.dart';
import 'package:oo/apis/repositories/usersuggestionrepositories.dart';

import '../apis/bloc/usersuggestionbloc.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';

import 'package:flutter/cupertino.dart';

import '../constants/response.dart';

class HomeItemWidget extends StatefulWidget {
  const HomeItemWidget({Key? key}) : super(key: key);

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {

  late UsersuggestionDetailsBloc _bloc;

  List<UserSuggestionModel> JoinedClubsearchdata = [];
  List<UserSuggestionModel> JoinedClubserachlist = [];
  TextEditingController JoinedClubController = TextEditingController();
  UserSuggestionRepository joinclubapi = UserSuggestionRepository();
  void initState() {
    super.initState();
    _bloc = UsersuggestionDetailsBloc();

    setState(() {});
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data.length}");
          return _tile(data[index].name,data[index].profilePic);
        });
  }
  SizedBox _tile(
      String title,String image) =>
      SizedBox(height: 300,
        child: IntrinsicWidth(
          child: Container(
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
                color: ColorConstant.indigo900,
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
                  child:image == null?Image.asset("assets/images/image1.png"): Image.network(image,
                    height: getVerticalSize(
                      50.00,
                    ),
                    width: getHorizontalSize(
                      55.00,
                    ),

                  ),
                ),
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
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      23.00,
                    ),
                    width: getHorizontalSize(
                      92.00,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.indigo900,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "Follow",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(
                          10,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
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
    return  StreamBuilder<Response>(
        stream: _bloc.UserSuggestionDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("sdfghjk");
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Container(
                  child:Center(child: CircularProgressIndicator()),
                ); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                break;
              case Status.SUCCESS:
                var patientappointmentList =
                    snapshot.data!.data;
                JoinedClubsearchdata = patientappointmentList;
                return _jobsListView(JoinedClubsearchdata);

                break;
              case Status.ERROR:
                return Container(
                  child:Center(child: CircularProgressIndicator()),
                );
            }
          }
          return Container(
            child:Center(child: CircularProgressIndicator()),
          );
        });
  }
}
