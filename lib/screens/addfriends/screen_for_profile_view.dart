//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../constants/colors.dart';
// import '../../constants/math_utils.dart';
// import '../homePage/navigator.dart';
//
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   @override
//   var buttonText = 'Follow';
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => DashBoard(UserName1: '',)));
//             },
//             icon: Icon(
//               Icons.close,
//               size: 20,
//               color: Colors.black,
//             )),
//         title: Padding(
//             padding: EdgeInsets.only(left: 297),
//             child: Image.asset("assets/images/menudots.png")),
//       ),
//       body: SingleChildScrollView(child:RefreshIndicator(    color: Colors.white,
//         backgroundColor: Colors.blue,    onRefresh: () {
//           return _bloc.getprofilesList();
//         },
//         child: StreamBuilder<Response<List<dynamic>>>(
//             stream: _bloc.profileDataStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 print("sdfghjk");
//                 switch (snapshot.data!.status) {
//                   case Status.LOADING:
//                     return Center(child: CircularProgressIndicator(color: ColorConstant.green6320,)); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
//                     break;
//                   case Status.SUCCESS:
//                     List<dynamic> patientappointmentList =
//                         snapshot.data!.data;
//                     profilesearchdata = patientappointmentList;
//                     return SingleChildScrollView(
//                         child: _jobsListView(profilesearchdata)
//                     );
//
//                     break;
//                   case Status.ERROR:
//                     return
//                       SizedBox(
//                           height: 300,
//                           child: Column(
//                             children: [
//                               Center(child: Image.asset("assets/images/clouderror.png",color: Colors.green[900],)),
//
//                               Center(child: Text("Offline",style: TextStyle(color: Colors.green[900]),)),
//                             ],
//                           ));
//
//                 }
//               }
//               return Container();
//             }),
//       )
//
//
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oo/constants/commonapierror.dart';
import 'package:oo/screens/profile/profile_details.dart';
import '../../apis/bloc/profile_page_bloc.dart';
import '../../apis/modelclass/profile_model.dart';
import '../../apis/repositories/joined_clubs.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';


var buttonText = 'Follow';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.id}) : super(key: key);
final int id ;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late SuggestionProfilePageBloc _bloc;
  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];
  List <dynamic> profilesearchdata = [];
  List<dynamic> profilelist = [];
  TextEditingController profileController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  void initState() {
    super.initState();
    _bloc = SuggestionProfilePageBloc();
    _bloc.getSuggestionProfileList(widget.id);
    setState(() {});
  }
  //
  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {

          return _tile(data[index].name,data[index].sport,data[index].bio,data[index].followersCount,data[index].followingCount);
        });
  }

  SizedBox _tile(String name,sport,bio ,followersCount,followingCount
      ) =>
      SizedBox(
        height: size.height,
        child:

        Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Image.asset("assets/images/profileimage.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Text(
                            "${name}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            "${sport==null?"":sport} Player",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            311.00,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              10.00,
                            ),
                            top: getVerticalSize(
                              7.00,
                            ),
                            right: getHorizontalSize(
                              10.00,
                            ),
                          ),
                          child: Text(
                            " ${bio==null?"":bio}",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                11,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                28.00,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: getHorizontalSize(
                                    53.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      59.00,
                                    ),
                                  ),
                                  child: Text(
                                    "70\nMatches",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        13,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.46,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    59.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      39.00,
                                    ),
                                  ),
                                  child: Text(
                                    "${followersCount}\nFollowers",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        13,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.46,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    58.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      39.00,
                                    ),
                                    right: getHorizontalSize(
                                      53.00,
                                    ),
                                  ),
                                  child: Text(
                                    "${followingCount}\nFollowing",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        13,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.46,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              20.00,
                            ),
                            top: getVerticalSize(
                              37.00,
                            ),
                            right: getHorizontalSize(
                              20.00,
                            ),
                            bottom: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                buttonText =
                                buttonText == "Follow" ? "Unfollow" : "Follow";
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                37.00,
                              ),
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: buttonText == "Follow" ? ColorConstant.green6320: Colors.white10,
                                  borderRadius: BorderRadius.circular(18.50),
                                  border: Border.all(
                                    color: buttonText == "Follow" ? Colors.white : Colors.black,
                                  )
                              ),
                              child: Text(buttonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: buttonText == "Follow" ? Colors.white : Colors.black,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      30.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      30.00,
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    13.00,
                  ),
                  bottom: getVerticalSize(
                    15.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          2.91,
                        ),
                        bottom: getVerticalSize(
                          3.91,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          29.18,
                        ),
                        width: getSize(
                          29.18,
                        ),
                        // child: SvgPicture.asset(
                        //   ImageConstant.imgVector9,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          4.46,
                        ),
                        bottom: getVerticalSize(
                          2.37,
                        ),
                      ),
                      child: Container(
                        height: getVerticalSize(
                          29.17,
                        ),
                        width: getHorizontalSize(
                          26.25,
                        ),
                        // child: SvgPicture.asset(
                        //   ImageConstant.imgVector10,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getVerticalSize(
                          1.00,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          35.00,
                        ),
                        width: getSize(
                          35.00,
                        ),
                        // child: SvgPicture.asset(
                        //   ImageConstant.imgBxmessagesqua1,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          1.00,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          35.00,
                        ),
                        width: getSize(
                          35.00,
                        ),
                        // child: SvgPicture.asset(
                        //   ImageConstant.imgBxuserpin1,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      );



  TextEditingController searchcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(

        body: RefreshIndicator(    color: Colors.white,
          backgroundColor: Colors.blue,    onRefresh: () {
            return _bloc.getSuggestionProfileList(widget.id);
          },
          child: StreamBuilder<Response<List<dynamic>>>(
              stream: _bloc.userprofileDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("sdfghjk");
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator(color: ColorConstant.green6320,)); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                    List<dynamic >patientappointmentList =
                          snapshot.data!.data;
                      profilesearchdata = patientappointmentList;
                      return SingleChildScrollView(
                          child: _jobsListView(profilesearchdata)
                      );

                      break;
                    case Status.ERROR:
                      return
                        SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Center(child: Image.asset("assets/images/clouderror.png",color: Colors.green[900],)),

                                Center(child: Text("Offline",style: TextStyle(color: Colors.green[900]),)),
                              ],
                            ));

                  }
                }
                return Container();
              }),
        )
    );
  }

}
