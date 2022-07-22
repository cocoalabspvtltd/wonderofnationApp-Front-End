import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';

import '../addClubs/myclubs.dart';
import '../apis/bloc/clublistbloc.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../dashboardItems/mymatches.dart';
import '../dropdowns/gamesdropdown.dart';
import '../homePage/navigator.dart';
import '../myresults/gamedetail.dart';
import '../screens/login.dart';
import '../screens/shimmer.dart';
import 'matchcourt.dart';

class clublist extends StatefulWidget {
  const clublist({Key? key}) : super(key: key);

  @override
  State<clublist> createState() => _clublistState();
}

class _clublistState extends State<clublist> {
  late ClubDetailsBloc _bloc;

  List<ClubModel> patientappointmentsearchdata = [];
  List<ClubModel> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();

  void initState() {
    super.initState();
    _bloc = ClubDetailsBloc();

    setState(() {});
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
  GridView _jobsListView(data) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 0.60 / 0.90,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Matchcourt(
                            Imageurl: '${data[index].img}',
                            clubName: '${data[index].name}',
                            stateName: '${data[index].state}',
                            cityName: '${data[index].city}', description: '${data[index].description}',
                          )));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      "${data[index].name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Text("1 km Away",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text("₹2000",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider("${data[index].img}"),
                ),
              ),
            ),
          );
        });
  }

  TextEditingController searchcontroller = new TextEditingController();
  TextEditingController dateinputcontroller =
      new TextEditingController(text: DateTime.now().toString());
  var date;
  var _valueToValidate3;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child: Icon(Icons.search,
                        size: 25, color: ColorConstant.black901)
                    // Image.asset("assets/images/search.png")
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child: Icon(Icons.notifications_none_rounded,
                        size: 25, color: ColorConstant.black901)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child: Icon(Icons.chat_bubble_outline,
                        size: 25, color: ColorConstant.black901)),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()),
                                  );
                                },
                                child: Text("X",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)))),
                      )),
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/mymatches.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("hg");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mymatches()),
                        );
                      },
                      child: Text(
                        "My Matches",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 4,
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/myclubs.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Myclubs()));
                      },
                      child: Text(
                        "My Clubs",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.MY_PROFILE);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/myresults.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Gamedetail()));
                      },
                      child: Text(
                        "My Results",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/payment.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        // WidgetsBinding.instance!.addPostFrameCallback((_) {
                        //   Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                        // });
                      },
                      child: Text(
                        "Payment Methods",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {},
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.settings,
                            color: Colors.black, size: 22)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                Divider(color: Colors.grey),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/images/privacy.png",
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Privacy & Security",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/help.png",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ]),
                  onTap: () {
                    // WidgetsBinding.instance!.addPostFrameCallback((_) {
                    //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                    // });
                  },
                ),
                ListTile(
                  title: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.logout, color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ]),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          color: Colors.white,
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
                      return Builder(
                        builder: (context) {
                          return Center(child: CircularProgressIndicator());
                        }
                      ); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                      List<ClubModel> patientappointmentList =
                          snapshot.data!.data;
                      patientappointmentsearchdata = patientappointmentList;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              33.50,
                            ),
                            bottom: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: getHorizontalSize(
                                  140.00,
                                ),
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    0.00,
                                  ),
                                  right: getHorizontalSize(
                                    170.00,
                                  ),
                                ),
                                child: RichText(
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
                                          color: ColorConstant.orange900,
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
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    24.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: getVerticalSize(
                                        40.00,
                                      ),
                                      width: getHorizontalSize(
                                        104.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          20.00,
                                        ),
                                        bottom: getVerticalSize(
                                          1.00,
                                        ),
                                      ),
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
                                      child: Padding(
                                          padding: EdgeInsets.only(
left: getHorizontalSize(10.00),
                                            top: getVerticalSize(
                                              10.00,
                                            ),
                                            bottom: getVerticalSize(
                                              6.00,
                                            ),
                                            right: getHorizontalSize(1.00),
                                          ),
                                          child: designationdropdown()),
                                    ),
                                    Container(
                                      height: getVerticalSize(
                                        40.00,
                                      ),
                                      width: getHorizontalSize(
                                        104.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          7.00,
                                        ),
                                        bottom: getVerticalSize(
                                          1.00,
                                        ),
                                      ),
                                      child: DateTimePicker(
                                        decoration: InputDecoration(
                                          // contentPadding: const EdgeInsets.symmetric(vertical: 0.2, horizontal: 1.0),
                                          contentPadding:
                                              EdgeInsets.only(left: 6),
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                            color: ColorConstant.black901,
                                            size: 14,
                                          ),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: ColorConstant.black900,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: ColorConstant.black900,
                                            ),
                                          ),
                                        ),
                                        type: DateTimePickerType.date,
                                        dateMask: 'dd.MM.yy',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Inter',
                                            color: ColorConstant.gray600),
                                        controller: dateinputcontroller,
                                        //initialValue: _initialValue,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2060),
                                        onChanged: (val) =>
                                            setState(() => date = val),
                                        validator: (val) {
                                          setState(() =>
                                              _valueToValidate3 = val ?? '');
                                          return null;
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => Searchlocation()));
                                      },
                                      child: Container(
                                          height: getVerticalSize(
                                            40.00,
                                          ),
                                          width: getHorizontalSize(
                                            104.00,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              7.00,
                                            ),
                                            bottom: getVerticalSize(
                                              1.00,
                                            ),
                                          ),
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
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 13,
                                                    color:
                                                        ColorConstant.gray600),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(320, 45),
                                  primary: ColorConstant.orange900,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                onPressed: () {},
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
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 220),
                                child: Text(
                                  "Find Your Court",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child:
                                    _jobsListView(patientappointmentsearchdata),
                              )
                            ],
                          ),
                        ),
                      );

                      break;
                    case Status.ERROR:
                      return Container();
                  }
                }
                return Container();
              }),
        ));
  }
}
