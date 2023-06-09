import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oo/apis/repositories/profile_page_repositories.dart';
import 'package:oo/screens/homePage/register_profile.dart';
import 'package:oo/screens/profile/profile_details.dart';
import '../../apis/bloc/profile_page_bloc.dart';
import '../../apis/modelclass/profile_model.dart';
import '../../apis/repositories/joined_clubs.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';
import 'edit_profile.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({Key? key}) : super(key: key);

  @override
  State<ProfileUi> createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  late ProfilePageBloc _bloc;
  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];
  List<dynamic> profilesearchdata = [];
  List<dynamic> profilelist = [];
  TextEditingController profileController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  void initState() {
    super.initState();
    _bloc = ProfilePageBloc();
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
          return _tile(data[index]);
        });
  }

  SizedBox _tile(ProfileModelClass data
       ) =>
      SizedBox(
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: getVerticalSize(
                              15.75,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        24.00,
                                      ),
                                      top: getVerticalSize(
                                        0.25,
                                      ),
                                      bottom: getVerticalSize(
                                        280.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        12.00,
                                      ),
                                      width: getHorizontalSize(
                                        16.00,
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        11.00,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                237.25,
                                              ),
                                              right: getHorizontalSize(
                                                7.25,
                                              ),
                                            ),
                                            child: Container(
                                              height: getVerticalSize(
                                                21.75,
                                              ),
                                              width: getHorizontalSize(
                                                19.50,
                                              ),
                                            ),
                                          ),
                                        ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius: BorderRadius.circular(60),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(60),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: '${data.profilePic}',
                                            placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                            errorWidget: (context, url, error) => CircleAvatar(
                                              radius: 46.0,
                                              backgroundImage:
                                              AssetImage('assets/images/profile.png'),
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                        SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(

                                              top: getVerticalSize(
                                                5.00,
                                              ),

                                            ),
                                            child: Text(
                                              "${data.name!.toUpperCase()}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  16,
                                                ),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                79.00,
                                              ),
                                              top: getVerticalSize(
                                                1.00,
                                              ),
                                              right: getHorizontalSize(
                                                79.00,
                                              ),
                                            ),
                                            child: Text(
                                              "${data.sport}",
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
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                17.00,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Container(
                                                    width: getHorizontalSize(
                                                      264.00,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                          getHorizontalSize(
                                                            53.00,
                                                          ),
                                                          child: Text(
                                                            "5\nMatches",
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                              ColorConstant
                                                                  .black901,
                                                              fontSize:
                                                              getFontSize(
                                                                13,
                                                              ),
                                                              fontFamily:
                                                              'Inter',
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              height: 1.46,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  ProfileDetailsScreen(fragmentToShow: 0,UserName: data.name?? "",
                                                                followerscount:data.followersCount.toString(),followingcount: data.followingCount.toString(), matchcount: data.matches.toString(),)),
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                            getHorizontalSize(
                                                              59.00,
                                                            ),
                                                            child: Text(
                                                              "${data.followersCount}\nFollowers",
                                                              maxLines: null,
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: TextStyle(
                                                                color:
                                                                ColorConstant
                                                                    .black901,
                                                                fontSize:
                                                                getFontSize(
                                                                  13,
                                                                ),
                                                                fontFamily:
                                                                'Inter',
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                height: 1.46,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  ProfileDetailsScreen(fragmentToShow: 1,UserName: data.name?? "",
                                                                followerscount:data.followersCount.toString(),followingcount: data.followingCount.toString(), matchcount: data.matches.toString())),
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                            getHorizontalSize(
                                                              58.00,
                                                            ),
                                                            child: Text(
                                                              "${data.followingCount}\nFollowing",
                                                              maxLines: null,
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: TextStyle(
                                                                color:
                                                                ColorConstant
                                                                    .black901,
                                                                fontSize:
                                                                getFontSize(
                                                                  13,
                                                                ),
                                                                fontFamily:
                                                                'Inter',
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                height: 1.46,
                                                              ),
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
                                                      10.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      25.00,
                                                    ),
                                                    right: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                    bottom: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                  ),
                                                  child: GestureDetector(onTap:()
                                                  {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context)=>EditProfile(UserName: data.name ?? "", UserEmail: data.email ??"", UserPhone: data.phone??"",UserPic:data.profilePic??"")));
                                                  } ,                                                   child: Container(
                                                      alignment: Alignment.center,
                                                      height: getVerticalSize(
                                                        37.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        163.00,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .green6320,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                          getHorizontalSize(
                                                            18.50,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Edit Profile",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          fontSize: getFontSize(
                                                            14,
                                                          ),
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                          FontWeight.w400,
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
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        8.00,
                                      ),
                                      top: getVerticalSize(
                                        2.25,
                                      ),
                                      right: getHorizontalSize(
                                        17.00,
                                      ),
                                      bottom: getVerticalSize(
                                        200.53,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        18.47,
                                      ),
                                      width: getHorizontalSize(
                                        20.00,
                                      ),
                                      // child: SvgPicture.asset(
                                      //   ImageConstant.imgGroup1,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                              data.sport == null ?
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                  child: Row(
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.23,),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(ColorConstant.green6320),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(18.0),
                                                  )
                                              )
                                          ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => RegisterProfile(names: '${data.name}',
                                                )),
                                          );
                                        }, child: Text("You can complete your leveling here"),),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                      Tooltip(
                                        height: MediaQuery.of(context).size.height * 0.05 ,
                                        message:
                                            'If you have not completed your leveling in registration,It is completed here.',
                                        padding: EdgeInsets.all(20),
                                        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.black900.withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(22)),
                                        showDuration: Duration(seconds: 10),
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.032,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.question_mark_sharp,
                                                  size: 15,
                                                  color: ColorConstant.black901,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  side: BorderSide(
                                                    color: ColorConstant.green6320,
                                                  ),
                                                  primary: ColorConstant.whiteA700,
                                                  shape: CircleBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.006,
                                            ),
                                            Text(
                                              "Tap and hold to info",
                                              style: TextStyle(
                                                  fontSize: 8.2, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )):
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        38.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        38.00,
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
                                  border: Border.all(
                                    color: ColorConstant.gray200,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          30.00,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                20.00,
                                              ),
                                            ),
                                            child: Text(
                                              "Level",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  16,
                                                ),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: getVerticalSize(
                                              15.00,
                                            ),
                                            width: getHorizontalSize(
                                              51.16,
                                            ),
                                            margin: EdgeInsets.only(
                                              top: getVerticalSize(
                                                4.00,
                                              ),
                                              right: getHorizontalSize(
                                                13.84,
                                              ),
                                              bottom: getVerticalSize(
                                                2.00,
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButtonFormField(
                                                focusNode: FocusNode(),
                                                icon: Image.asset(
                                                  "assets/images/dropdown.png",
                                                  height: getSize(
                                                    4.17,
                                                  ),
                                                  width: getSize(
                                                    8.33,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                                style: TextStyle(
                                                  color:
                                                  ColorConstant.green6320,
                                                  fontSize: getFontSize(
                                                    12,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                onChanged: (value) {},
                                                items: dropdownItemList.map<
                                                    DropdownMenuItem<
                                                        String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                          TextAlign.center,
                                                        ),
                                                      );
                                                    }).toList(),
                                                decoration: InputDecoration(
                                                  hintText: 'Tennis',
                                                  hintStyle: TextStyle(
                                                    fontSize: getFontSize(
                                                      12.0,
                                                    ),
                                                    color:
                                                    ColorConstant.black901,
                                                  ),
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  contentPadding:
                                                  EdgeInsets.all(0),
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
                                          48.00,
                                        ),
                                        top: getVerticalSize(
                                          35.00,
                                        ),
                                        right: getHorizontalSize(
                                          48.00,
                                        ),
                                      ),
                                      child: Text(
                                        "${Level}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          11.00,
                                        ),
                                        bottom: getVerticalSize(
                                          20.00,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(left:
                                              12.0,right:12),
                                              child: LinearProgressIndicator(
                                                value:10.0,
                                              )
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  11.00,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        20.00,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Low reliability",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .green6320,
                                                        fontSize: getFontSize(
                                                          10,
                                                        ),
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: getHorizontalSize(
                                                        17.50,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "High reliability",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .green6320,
                                                        fontSize: getFontSize(
                                                          10,
                                                        ),
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                  33.00,
                                                ),
                                                right: getHorizontalSize(
                                                  20.00,
                                                ),
                                              ),
                                              child: Text(
                                                "Statistics of result",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                10.00,
                                              ),
                                              top: getVerticalSize(
                                                27.00,
                                              ),
                                              right: getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:Colors.black,
                                                width: getHorizontalSize(
                                                  1.00,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: getHorizontalSize(
                                                    67.00,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      28.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      13.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      36.00,
                                                    ),
                                                  ),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                          'Total Matches\n\n',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              10,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '5',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              14,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Container(
                                                  width: getHorizontalSize(
                                                    21.00,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    top: getVerticalSize(
                                                      13.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      36.00,
                                                    ),
                                                  ),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Won\n\n',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              10,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '3',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              14,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Container(
                                                  width: getHorizontalSize(
                                                    21.00,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    top: getVerticalSize(
                                                      13.00,
                                                    ),
                                                    right: getHorizontalSize(
                                                      43.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      36.00,
                                                    ),
                                                  ),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Lost\n\n',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              10,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '2',
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                            getFontSize(
                                                              14,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                            FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  22.50,
                                                ),
                                                top: getVerticalSize(
                                                  11.00,
                                                ),
                                                right: getHorizontalSize(
                                                  22.50,
                                                ),
                                              ),
                                              child: Text(
                                                "See all result",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color:
                                                  ColorConstant.green6320,
                                                  fontSize: getFontSize(
                                                    12,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
  ProfilepageRepositories profileimageupload = ProfilepageRepositories();
  Widget build(BuildContext context) {
    return Scaffold(

        body: RefreshIndicator(    color: Colors.white,
          backgroundColor: Colors.blue,    onRefresh: () {
          return _bloc.getprofilesList();
        },
          child: StreamBuilder<Response<List<dynamic>>>(
              stream: _bloc.profileDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("sdfghjk");
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator(color: ColorConstant.green6320,)); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                      List<dynamic> patientappointmentList =
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
