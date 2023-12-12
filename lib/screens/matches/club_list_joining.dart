import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/joined_clubs.dart';
import '../../apis/bloc/club_list_bloc.dart';
import '../../apis/repositories/club_list_repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../../constants/response.dart';
import '../dropdowns/games_dropdown.dart';
import '../dropdowns/register_game_dropdown.dart';
import 'club_details.dart';

TextEditingController dateinputcontroller = new TextEditingController(
    text: formatDate(DateTime.now(), [dd, '-', m, '-', yyyy]));

class ClubList extends StatefulWidget {
  const ClubList({Key? key}) : super(key: key);

  @override
  State<ClubList> createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  late ClubDetailsBloc _bloc;
  ClubRepository sortListClub = ClubRepository();
  //ClubRepository1 sortListClub1 = ClubRepository1();
  List<ClubModel> patientappointmentsearchdata = [];
  List<ClubModel> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();

  void initState() {
    super.initState();
    _bloc = ClubDetailsBloc();
    Locationid;
    designatioids;
    _bloc.getvitalsignList();
    designatioids;
    Locationid;
    setState(() {

    });
  }

  onSearchTextChanged(String text) async {
    patientappointmentserachlist.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    patientappointmentsearchdata.forEach((data) {
      if (data.name!.toLowerCase().contains(text) || data.name!.contains(text))
        patientappointmentserachlist.add(data);
    });

    setState(() {});
  }
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              colorScheme: ColorScheme.light(
                  primary: ColorConstant.green6320,
                  primaryVariant: Colors.black,
                  secondaryVariant: Colors.black,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? Text(""),
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2060));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String da = picked.day.toString() +
            "-" +
            picked.month.toString() +
            "-" +
            picked.year.toString();
        dateinputcontroller.text = da;

      });
  }

  var updatedata;


  @override
  GridView _jobsListView(data) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.60 / 0.90,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          print("data.length->${ data[index].img}");
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ClubDetails(club_id: data[index].id,
                            date: dateinputcontroller.text,
                          )));
            },
            child: Stack(
              children: [
                Container(
                  height: 550,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: data[index].img?? "",
                    placeholder: (context, url) => Center(child: Container(height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: ColorConstant.green6320,))),
                    errorWidget: (context, url, error) =>Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset("assets/images/clubmixed.jpg",fit: BoxFit.fill,)
                    ),


                  ),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(30)
                  ),
                ),
                Positioned(
                  top: 150.0,
                  left: 10,
                  child: Text(
                    "${data[index].name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
                Positioned(
                    top: 170.00,
                    left: 10,
                    child: Text("${data[index].city}/${data[index].state}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13))),

              ],
            ),
          );
        });
  }

  TextEditingController searchcontroller = new TextEditingController();

  bool isLoding = false;

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body:
        RefreshIndicator(
          color: Colors.green,
          backgroundColor: Colors.blue,
          onRefresh: () {
            return _bloc.getvitalsignList();
          },
          child: StreamBuilder<Response<List<ClubModel>>>(
              stream: _bloc.vitalsignDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("sdfghjk");
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Builder(builder: (context) {
                        return Center(child: Container(height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: ColorConstant.green6320,)));
                      });
                    case Status.SUCCESS:
                      List<ClubModel> patientappointmentList =
                          snapshot.data!.data;
                      patientappointmentsearchdata = patientappointmentList;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(
                              15
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Create your \n',
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          24,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'matches',
                                      style: TextStyle(
                                        color: ColorConstant.green6320,
                                        fontSize: getFontSize(
                                          24,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: screenHeight * 0.052,
                                      width: screenWidth * 0.32,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            5.00,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: ColorConstant.black900,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: DesignationDropdown()),
                                Spacer(),
                                  Container(
                                    width: screenWidth * 0.3,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.only(left: 12),
                                        suffixIcon: Icon(
                                          Icons.calendar_month,
                                          color: Colors.black, size: 14,),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius
                                              .circular(5.0),
                                          borderSide: BorderSide(
                                            color:
                                            Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius
                                              .circular(5.0),
                                          borderSide: BorderSide(
                                            color:
                                            Colors.black,
                                          ),
                                        ),
                                      ),
                                      // dateMask: 'dd.MM.yy',
                                      style: TextStyle(fontSize: 10.5,
                                          fontFamily: 'Inter',
                                          color: Colors.grey),
                                      controller: dateinputcontroller,
                                      // keyboardType: TextInputType.datetime,
                                      onTap: () {
                                        _selectDate(context);
                                        print(
                                            "dateinputcontroller.text===>${dateinputcontroller
                                                .text}");
                                      },

                                    ),
                                  ),
                                  Spacer(),

                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => Searchlocation()));
                                    },
                                    child: Container(
                                        height: screenHeight * 0.052,
                                        width: screenWidth * 0.27,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              5.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: ColorConstant.black900,
                                            width: getHorizontalSize(
                                              1.00,
                                            ),
                                          ),
                                        ),
                                        child: LocationDropdown()),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(320, 45),
                                    primary: ColorConstant.green6320,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                        borderRadius:
                                        BorderRadius.circular(10.0)),
                                  ),
                                  onPressed: () async {
                                    _bloc.getvitalsignList();
                                    patientappointmentsearchdata =
                                    await sortListClub.getclubList();
                                    setState(() {
                                      updatedata = patientappointmentsearchdata;

                                      // onSearchTextChanged;
                                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>clublist1()));
                                    });

                                  },
                                  child: Text(
                                    "Search",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        17,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 220),
                                child: Text(
                                  "Find Your Club",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              patientappointmentList.isEmpty  ?
                              Center(child: Container(child: Text("NO COURT AVAILABLE",style:
                              TextStyle(fontWeight: FontWeight.w500),),)) :
                              _jobsListView(patientappointmentList),
                            ],
                          ),
                        ),
                      );
                    case Status.ERROR:
                      return Container();
                  }
                }
                return Container();
              }),
        ));
  }
}