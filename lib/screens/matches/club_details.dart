import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/club_details_model.dart';


import 'package:http/http.dart' as http;
import 'package:oo/screens/matches/reservation_court.dart';

import '../../apis/bloc/club_detials_bloc.dart';
import '../../apis/repositories/club_details_repositories.dart';
import '../../apis/repositories/register_Repositories.dart';
import '../../constants/base_urls.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';
import 'club_list_joining.dart';


class ClubDetails extends StatefulWidget {
  const ClubDetails({Key? key, required this.club_id, required this.date}) : super(key: key);
final int club_id;
final String date;
  @override
  State<ClubDetails> createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  late ClubDetailsListBloc _bloc;
  ClubDetailsRepository sortListClub = ClubDetailsRepository();
  List<ClubDetailsModel> ClubDetailssearchdata = [];
  List<ClubDetailsModel> ClubDetailsModelserachlist = [];
  TextEditingController ClubDetailsModelController = TextEditingController();
 // ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  List court = ["Court 1", "Court 2", "Court 3"];
  int selectedIndex2 = 0;
  List gallery=[
    "assets/images/court.png",
    "assets/images/past.png",
    "assets/images/spash5.jpg",
  ];
List Imagelist = [];
  void initState() {
    super.initState();
    getallcourtImage();
    print("date-->${widget.date}");
    _bloc = ClubDetailsListBloc(widget.club_id);
print("object=>>>>>${Imagelist}");
    setState(() {});
  }
  List imglist = [];

  Future getallcourtImage() async {
    print("imgurl->>>.${baseurl}clubs/our/courts?club_id=${widget.club_id}");

    http.Response response = await http.get(Uri.parse('${baseurl}clubs/our/courts?club_id=${widget.club_id}'), headers: <String, String>{
      'Accept': "appilication/json",
      'Authorization': 'Bearer $TOKEN',
    },);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        imglist = jsonData;
        print("Imagelist->${imglist}");
      });
    }
  }

  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data.length}");
          return _tile(data[index].img, data[index].name,
              data[index].description ,data[index].state,data[index].city);
        });
  }
  SizedBox _tile(
      String img, String name, String description,String state,String city) =>
      SizedBox(height: size.height,
          child:  SafeArea(
            child: Container(
              width: size.width,
              child:
              Container(

                width: size.width,
                decoration: BoxDecoration(
                  color: ColorConstant.gray200,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: getVerticalSize(
                          340.00,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CachedNetworkImage(
                                imageUrl: img ?? "",
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset("assets/images/football.jpg",fit: BoxFit.fill,),
                                height: getVerticalSize(
                                  400.00,
                                ),
                                width: getHorizontalSize(
                                  360.00,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 10,
                                left: 10,
                                child: GestureDetector(onTap: (){

                                },
                                  child: IconButton(onPressed: (){ Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ClubList()),
                                  );}, icon: Icon(Icons.arrow_back_outlined,
                            color: ColorConstant.whiteA700,)),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(

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


                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: getHorizontalSize(
                                      140.00,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        30.00,
                                      ),
                                      top: 10
                                    ),
                                    child: Text(
                                      name,
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          27,
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
                                  30.00,
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
                                        1.67,
                                      ),
                                      bottom: getVerticalSize(
                                        11.66,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        25.67,
                                      ),
                                      width: getHorizontalSize(
                                        22.33,
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
                                        14.34,
                                      ),
                                      right: getHorizontalSize(
                                        30.00,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state}/ ${city}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(23,),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: getVerticalSize(
                                              2.00,
                                            ),
                                            right: getHorizontalSize(
                                              10.00,
                                            ),
                                          ),
                                          child: Text(
                                            "3.5 km away",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                15,
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  30.00,
                                ),
                                top: getVerticalSize(
                                  22.00,
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
                                    17,
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
                                    7.00,
                                  ),
                                  right: getHorizontalSize(
                                    30.00,
                                  ),
                                ),
                                child: Text(
                                  description,
                                  maxLines: null,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 15,),
                            Padding(
                              padding: EdgeInsets.only(left: 27),
                              child: Text(
                                "Our Courts",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            CarouselSlider.builder(
                              itemCount: imglist.length,
                              options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  height: 160
                              ),
                              itemBuilder: (ctx, index, realIdx) {
                                return Container(
                                  width: size.width,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fitWidth,
                                    imageUrl: imglist[index]["img"] == null
                                        ? "assets/images/football.jpg"
                                        : imglist[index]["img"],
                                    placeholder: (context, url) => Center(
                                      child: Container(height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(color: ColorConstant.green6320,)),
                                    ),
                                    errorWidget: (context, url, error) =>
                                    imglist[index]["img"] == null
                                        ? Image.asset(
                                      "assets/images/football.jpg",
                                      fit: BoxFit.fill,
                                    )
                                        : imglist[index]["img"],
                                  ),
                                );
                              },
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservationCourt(club_id: widget.club_id, date: widget.date, ClubName: name, state: state, city: city,)));
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
                                      color: ColorConstant.green6320,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Reserve Court",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),);

  TextEditingController searchcontroller = new TextEditingController();
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());


  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: ColorConstant.whiteA700,

        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.blue,
          onRefresh: () {
            return _bloc.getClubDetailsList(widget.club_id);
          },
          child: StreamBuilder<Response<List<ClubDetailsModel>>>(
              stream: _bloc.ClubDetailsDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("sdfghjk");
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Builder(builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      }); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                      List<ClubDetailsModel> clubdetailsList =
                          snapshot.data!.data;
                      ClubDetailsModelserachlist = clubdetailsList;
                      return SingleChildScrollView(child:_jobsListView(ClubDetailsModelserachlist));

                      break;
                    case Status.ERROR:
                      return Container(  color: Colors.red,);
                  }
                }
                return Container(  color: Colors.white,);
              }),
        ));
  }
}
