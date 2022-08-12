import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:oo/apis/modelclass/clublistmodel.dart';
import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/dashboardItems/about.dart';
import 'package:oo/dashboardItems/help.dart';
import 'package:oo/dashboardItems/privacy.dart';
import 'package:oo/paymentdash/paymentpage.dart';
import '../addClubs/myclubs.dart';
import '../apis/bloc/clublistbloc.dart';
import '../apis/repositories/clublistrepositories.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../dashboardItems/mymatches.dart';
import '../dropdowns/gamesdropdown.dart';
import '../dropdowns/registergamedropdown.dart';
import '../homePage/navigator.dart';
import '../myresults/gamedetail.dart';
import '../screens/login.dart';
import 'clubdetails.dart';

TextEditingController dateinputcontroller = new TextEditingController(
    text: formatDate(DateTime.now(), [dd, '-', m, '-', yyyy]));

class clublist extends StatefulWidget {
  const clublist({Key? key}) : super(key: key);

  @override
  State<clublist> createState() => _clublistState();
}

class _clublistState extends State<clublist> {
  late ClubDetailsBloc _bloc;
  ClubRepository sortListClub = ClubRepository();
  List<ClubModel> patientappointmentsearchdata = [];
  List<ClubModel> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();

  void initState() {
    super.initState();
    _bloc = ClubDetailsBloc();
    Locationid = 0;
    designatioids = 0;
    _bloc.getvitalsignList();
    designatioids;
    Locationid;

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
              accentColor: Colors.black,
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
                    fit: BoxFit.fill,
                    imageUrl: data[index].img == null
                        ?  Image.asset("assets/images/football.jpg",fit: BoxFit.fill,)
                        : data[index].img,
                    placeholder: (context, url) => CircularProgressIndicator(color: ColorConstant.green6320,),
                    errorWidget: (context, url, error) =>
                Image.asset("assets/images/football.jpg",fit: BoxFit.fill,)

                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorConstant.whiteA700,
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
                        size: 25, color: ColorConstant.whiteA700)
                  // Image.asset("assets/images/search.png")
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child: Icon(Icons.notifications_none_rounded,
                        size: 25, color: ColorConstant.whiteA700)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    child: Icon(Icons.chat_bubble_outline,
                        size: 25, color: ColorConstant.whiteA700)),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorConstant.whiteA700,
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashBoard(
                                              UserName1: '',
                                            )),
                                  );
                                },
                                child: Icon(CupertinoIcons.clear_circled)
                            )
                        ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Paymentmethod(

                                  )),
                        );
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Privacy_page()));
                      },
                      child: Text(
                        "Privacy & Security",
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
                        "assets/images/help.png",
                        color: Colors.black,
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
                                builder: (context) => Help_page()));
                      },
                      child: Text(
                        "Help",
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
                        "assets/images/about.png", height: 20,
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
                                builder: (context) => Aboutus_page()));
                      },
                      child: Text(
                        "About us",
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
                      return Builder(builder: (context) {
                        return Center(child: CircularProgressIndicator(color: ColorConstant.green6320,));
                      }); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                      break;
                    case Status.SUCCESS:
                      List<ClubModel> patientappointmentList =
                          snapshot.data!.data;
                      patientappointmentsearchdata = patientappointmentList;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    20.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                          height: getVerticalSize(
                                            53.00,
                                          ),
                                          width: getHorizontalSize(
                                            110.00,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              9.00,
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
                                          child: designationdropdown()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: getVerticalSize(
                                          60.00,
                                        ),
                                        width: getHorizontalSize(
                                          110.00,
                                        ),

                                        margin: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            7.00,
                                          ),

                                        ),
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
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => Searchlocation()));
                                      },
                                      child: Container(
                                          height: getVerticalSize(
                                            53.00,
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
                                          child: LocationDropdown()),
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

                                  ;
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
                                  (patientappointmentList.length!= 0)
                                      ?
                                   _jobsListView(patientappointmentList)
                                      : (updatedata.length !=
                                      0) ? _jobsListView(
                                      updatedata):_jobsListView(patientappointmentList)


                              ),
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
