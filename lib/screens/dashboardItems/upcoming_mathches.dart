import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/matchdescription_modelk.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/screens/matches/add_players.dart';
import 'package:oo/screens/profile/edit_profile.dart';
import '../../apis/bloc/matchdescriptionbloc.dart';
import '../../apis/modelclass/club_details_model.dart';
import '../../constants/response.dart';
import 'add_match_players.dart';
import 'my_matches.dart';
List<PlayersupcomingPlayers> datas =[];
class Upcomingmatch extends StatefulWidget {
   Upcomingmatch({Key? key,required this.id,required this.pendingamount,required this.nopaycount}) : super(key: key);
int id ;
String pendingamount;
String nopaycount;
  @override
  State<Upcomingmatch> createState() => _UpcomingmatchState();
}

class _UpcomingmatchState extends State<Upcomingmatch> {
  @override
  PackagesBlocUser? _bloc;

  void initState() {
    super.initState();
print("id-??${widget.id}");
    _bloc =PackagesBlocUser();
    _bloc?.getAllPackagesList(widget.id);

    setState(() {});
  }
  int count = 0;
  String paymentDone="";

  TextEditingController searchcontroller = new TextEditingController();
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());


  Widget build(BuildContext context) {
    print(widget.pendingamount);
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.blue,
          onRefresh: () {
            return _bloc?.getAllPackagesList(widget.id);
          },
          child: StreamBuilder<Response<MatchDescriptionModel>>(
              stream: _bloc?.allPackagesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Builder(builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      }); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.COMPLETED:
                      MatchDescriptionModel clubdetailsList =
                          snapshot.data!.data;
                 count= clubdetailsList.match!.playerCount!;
                  paymentDone=clubdetailsList!.match!.paymentDone!;
                    datas = clubdetailsList.match!.players!;
                      return SingleChildScrollView(
                        child: Container(
                        width: size.width,
                        child:
                        Container(
                          height: size.height,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.gray400,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: getVerticalSize(
                                    450.00,
                                  ),
                                  width: size.width,
                                  margin: EdgeInsets.only(
                                    bottom: getVerticalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          "assets/images/football.jpg",
                                          height: getVerticalSize(
                                            450.00,
                                          ),
                                          width: getHorizontalSize(
                                            360.00,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                          top:30,
                                          left:15,child: IconButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '',)));
                                      }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,))),

                                    ],
                                  ),

                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        getHorizontalSize(
                                          40.00,
                                        ),
                                      ),
                                      topRight: Radius.circular(
                                        getHorizontalSize(
                                          40.00,
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: getHorizontalSize(
                                                162.00,
                                              ),
                                              margin: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  30.00,
                                                ),
                                              ),
                                              child: Text(
                                                "${clubdetailsList.match?.clubName}",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    24,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  23.00,
                                                ),
                                                right: getHorizontalSize(
                                                  30.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  4.00,
                                                ),
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: getVerticalSize(
                                                  31.00,
                                                ),
                                                width: getHorizontalSize(
                                                  106.00,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: ColorConstant.gray600,
                                                  borderRadius: BorderRadius.circular(
                                                    getHorizontalSize(
                                                      10.00,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Court price : ${clubdetailsList.match?.courtPrice}",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      13,
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
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            37.00,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  33.33,
                                                ),
                                                top: getVerticalSize(
                                                  4.67,
                                                ),
                                                bottom: getVerticalSize(
                                                  11.66,
                                                ),
                                              ),
                                              child: Container(
                                                height: getVerticalSize(
                                                  16.67,
                                                ),
                                                width: getHorizontalSize(
                                                  13.33,
                                                ),
                                                child: Image.asset(
                                                  "assets/images/location.png",
                                                  fit: BoxFit.fill,color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  10.33,
                                                ),
                                                top: getVerticalSize(
                                                  4.67,
                                                ),
                                                bottom: getVerticalSize(
                                                  11.66,
                                                ),
                                              ),
                                              child: Text(
                                                "${clubdetailsList.match?.cityName}/ ${clubdetailsList.match?.stateName}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            18.00,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  33.00,
                                                ),
                                              ),
                                              child: Container(
                                                height: getSize(
                                                  15.00,
                                                ),
                                                width: getSize(
                                                  15.00,
                                                ),
                                                child: Image.asset(
                                                  "assets/images/calender.png",
                                                  fit: BoxFit.fill,color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  12.00,
                                                ),
                                                right: getHorizontalSize(
                                                  148.00,
                                                ),
                                              ),
                                              child: Text(
                                                "${clubdetailsList.match?.date}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 28.0,top: 20),
                                        child: Text("BOOKINGID : ${clubdetailsList.match?.booking_id}",style: TextStyle(fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            30.00,
                                          ),
                                          top: getVerticalSize(
                                            20.00,
                                          ),
                                          right: getHorizontalSize(
                                            30.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Description",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.green6320,
                                            fontSize: getFontSize(
                                              18,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: getHorizontalSize(
                                            300.00,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              30.00,
                                            ),
                                            top: getVerticalSize(
                                              10.00,
                                            ),
                                            right: getHorizontalSize(
                                              30.00,
                                            ),
                                          ),
                                          child: Text(
                                            "${clubdetailsList.match?.description}",
                                            maxLines: null,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                11,
                                              ),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                         Row(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 27.0),
                                               child: Text("${count} Players Added",style: TextStyle(color: Colors.black),),
                                             ),

                                           ],
                                         ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              30.00,
                                            ),
                                            top: getVerticalSize(
                                              40.00,
                                            ),
                                            right: getHorizontalSize(
                                              30.00,
                                            ),
                                            bottom: getVerticalSize(
                                              20.00,
                                            ),
                                          ),
                                          child: GestureDetector(onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>AddMatchPlayers(Amount: widget.pendingamount,
                                                  PaymentDone: paymentDone,Nopaycount:widget.nopaycount,
                                                  bookingid:clubdetailsList.match!.booking_id,
                                                )));

                                          },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: getVerticalSize(
                                                45.00,
                                              ),
                                              width: getHorizontalSize(
                                                300.00,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: 0.5),
                                                color: ColorConstant.whiteA700,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    5.00,
                                                  ),

                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Edit Players",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: ColorConstant.black901,
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                                  Icon(Icons.edit,size: 17,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,)
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ),);

                      break;
                    case Status.ERROR:
                      return Container(  color: Colors.white,);
                  }
                }
                return Container(  color: Colors.red,);
              }),
        ));
  }

  // Future _showPlayerListDialog(List<PlayersupcomingPlayers> data1) async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title:  Text("Players List"),
  //         content:Container(    height: 300.0, // Change as per your requirement
  //           width: 300.0,
  //           child: ListView.builder(
  //               shrinkWrap: true,
  //               physics: BouncingScrollPhysics(),
  //               padding: const EdgeInsets.all(8),
  //               itemCount:data1.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return Container(
  //                   height: MediaQuery.of(context).size.height * 0.3,
  //                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         height: 35,
  //                         width: 35,
  //                         child: ClipRRect(
  //                           borderRadius:
  //                           BorderRadius.circular(
  //                               10
  //                           ),
  //                           child: CachedNetworkImage(
  //                             imageUrl:data1[index]!.profilePic!,
  //                             placeholder: (context, url) => CircularProgressIndicator(),
  //                             errorWidget: (context, url, error) => Image.asset(
  //                               "assets/images/user1.png",
  //                               height:
  //                               25.00,
  //                               width:
  //                               50.00,
  //                               fit: BoxFit.fill,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
  //                       Text("${data1[index].name}",style: TextStyle(fontWeight: FontWeight.w500),),
  //                       Spacer(),
  //
  //                     ],
  //                   ),
  //                 );
  //               }
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child:  Text('Ok',style: TextStyle(color: ColorConstant.green6320,fontWeight: FontWeight.w500),),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

}