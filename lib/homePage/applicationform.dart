
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oo/apis/repositories/academyregistrationrepositories.dart';
import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../dropdowns/gamesdropdown.dart';
import 'applicationformSubmitted.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ApplicationFormScreen extends StatefulWidget {
  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  XFile? _image;
  File? _video;
  VideoPlayerController? _videoPlayerController;
AcademyRegistrationRepository AppicationformApi = AcademyRegistrationRepository();
  final ImagePicker _picker = ImagePicker();

  String dropdownvalue = 'Select';
String ImgPath = "";
String videoPath = "";
  late final Function()? onChanged;

  File? imageFile;

  TextEditingController NameController = TextEditingController();

  TextEditingController DateOfBiirthController = TextEditingController();

  TextEditingController AddressController  = TextEditingController();

  TextEditingController Mobilenumbercontroller  = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  List<String> gender = ["Female", "Male", "others",];

  List<String> sport = ["Tennis", "Football", "Cricket", "Swimming","Badminton","Golf"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
    title: Row(
    children: [
    Container(
    width: width * 0.64,
    height: 30,
    margin: const EdgeInsets.symmetric(vertical: 10,),
    child: Center(
    child: Text(
    "Application Form",
    style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold),
    )),
    ),
    SizedBox(
    width: 27,
    ),
    ],
    ),
    ),
    backgroundColor: ColorConstant.whiteA700,
    body: Container(
    decoration: BoxDecoration(
    color: ColorConstant.whiteA700,
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Expanded(
    child: Align(
    alignment: Alignment.centerLeft,
    child: SingleChildScrollView(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    35.00,
    ),
    bottom: getVerticalSize(
    20.00,
    ),
    ),
    child: Padding(
    padding: EdgeInsets.only(
    left: getHorizontalSize(
    20.00,
    ),
    right: getHorizontalSize(
    20.00,
    ),
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Padding(
    padding: EdgeInsets.only(
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Container(
    height: getVerticalSize(
    14.00,
    ),
    width: getHorizontalSize(
    16.00,
    ),
    // child: SvgPicture.asset(
    //   ImageConstant.imgVector12,
    //   fit: BoxFit.fill,
    // ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    10.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Sport",
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
    Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    margin: EdgeInsets.only(
    top: getVerticalSize(
    13.00,
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
    color: ColorConstant.bluegray100,
    width: getHorizontalSize(
    1.00,
    ),
    ),
    ),
    child: Padding(
    padding: EdgeInsets.only(
    left: getHorizontalSize(
    10.00,
    ),
    top: getVerticalSize(
    10.00,
    ),
    bottom: getVerticalSize(
    11.00,
    ),
    ),
    child: designationdropdown(),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    21.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Applicant Name",
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
    top: getVerticalSize(
    14.00,
    ),
    ),
    child: Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    child: TextFormField(
    controller: NameController,
    keyboardType: TextInputType.text,
    focusNode: FocusNode(),
    decoration: InputDecoration(
    hintText: 'Andria Jacob',
    hintStyle: TextStyle(
    fontSize: getFontSize(
    12.0,
    ),
    color: ColorConstant.gray400,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    filled: true,
    fillColor: ColorConstant.whiteA700,
    contentPadding: EdgeInsets.only(
    left: getHorizontalSize(
    18.00,
    ),
    top: getVerticalSize(
    12.00,
    ),
    right: getHorizontalSize(
    30.00,
    ),
    bottom: getVerticalSize(
    12.00,
    ),
    ),
    ),
    style: TextStyle(
    color: ColorConstant.gray400,
    fontSize: getFontSize(
    12.0,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    ),
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    20.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Date Of Birth",
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
    top: getVerticalSize(
    14.00,
    ),
    ),
    child: Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    child: TextFormField(
    controller: DateOfBiirthController,
    keyboardType: TextInputType.datetime,
    focusNode: FocusNode(),
    decoration: InputDecoration(
    hintText: '11/12/2000',
    hintStyle: TextStyle(
    fontSize: getFontSize(
    12.0,
    ),
    color: ColorConstant.gray400,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    filled: true,
    fillColor: ColorConstant.whiteA700,
    isDense: true,
    contentPadding: EdgeInsets.only(
    left: getHorizontalSize(
    18.00,
    ),
    top: getVerticalSize(
    12.00,
    ),
    right: getHorizontalSize(
    30.00,
    ),
    bottom: getVerticalSize(
    12.00,
    ),
    ),
    ),
    style: TextStyle(
    color: ColorConstant.gray400,
    fontSize: getFontSize(
    12.0,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    ),
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    21.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Gender",
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
    Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    margin: EdgeInsets.only(
    top: getVerticalSize(
    13.00,
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
    color: ColorConstant.bluegray100,
    width: getHorizontalSize(
    1.00,
    ),
    ),
    ),
    child: Padding(
    padding: EdgeInsets.only(
    left: getHorizontalSize(
    10.00,
    ),
    top: getVerticalSize(
    10.00,
    ),
    bottom: getVerticalSize(
    11.00,
    ),
    ),
    child: MyHomePage14()

    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    20.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Address",
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
    top: getVerticalSize(
    14.00,
    ),
    ),
    child: Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    child: TextFormField(
    controller: AddressController,
    keyboardType: TextInputType.text,
    focusNode: FocusNode(),
    decoration: InputDecoration(
    hintText: 'Enter your address',
    hintStyle: TextStyle(
    fontSize: getFontSize(
    12.0,
    ),
    color: ColorConstant.gray400,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    filled: true,
    fillColor: ColorConstant.whiteA700,
    isDense: true,
    contentPadding: EdgeInsets.only(
    left: getHorizontalSize(
    18.00,
    ),
    top: getVerticalSize(
    12.00,
    ),
    right: getHorizontalSize(
    30.00,
    ),
    bottom: getVerticalSize(
    12.00,
    ),
    ),
    ),
    style: TextStyle(
    color: ColorConstant.gray400,
    fontSize: getFontSize(
    12.0,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    ),
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(
    top: getVerticalSize(
    21.00,
    ),
    right: getHorizontalSize(
    10.00,
    ),
    ),
    child: Text(
    "Mobile No.",
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
    top: getVerticalSize(
    14.00,
    ),
    ),
    child: Container(
    height: getVerticalSize(
    39.00,
    ),
    width: getHorizontalSize(
    320.00,
    ),
    child: TextFormField(
    controller: Mobilenumbercontroller,
    keyboardType: TextInputType.phone,
    focusNode: FocusNode(),
    decoration: InputDecoration(
    hintText: '+91 8546321557',
    hintStyle: TextStyle(
    fontSize: getFontSize(
    12.0,
    ),
    color: ColorConstant.gray400,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
    getHorizontalSize(
    5.00,
    ),
    ),
    borderSide: BorderSide(
    color: ColorConstant.bluegray100,
    width: 1,
    ),
    ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: ColorConstant.bluegray100,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: ColorConstant.whiteA700,
      isDense: true,
      contentPadding: EdgeInsets.only(
        left: getHorizontalSize(
          18.00,
        ),
        top: getVerticalSize(
          12.00,
        ),
        right: getHorizontalSize(
          30.00,
        ),
        bottom: getVerticalSize(
          12.00,
        ),
      ),
    ),
      style: TextStyle(
        color: ColorConstant.gray400,
        fontSize: getFontSize(
          12.0,
        ),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    ),
    ),
    ),
      Padding(
        padding: EdgeInsets.only(
          top: getVerticalSize(
            21.00,
          ),
          right: getHorizontalSize(
            10.00,
          ),
        ),
        child: Text(
          "Email Id",
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
          top: getVerticalSize(
            14.00,
          ),
        ),
        child: Container(
          height: getVerticalSize(
            39.00,
          ),
          width: getHorizontalSize(
            320.00,
          ),
          child: TextFormField(
            controller: EmailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: FocusNode(),
            decoration: InputDecoration(
              hintText: 'andriajacob2000@gmail.com',
              hintStyle: TextStyle(
                fontSize: getFontSize(
                  12.0,
                ),
                color: ColorConstant.gray400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
                borderSide: BorderSide(
                  color: ColorConstant.bluegray100,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
                borderSide: BorderSide(
                  color: ColorConstant.bluegray100,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
                borderSide: BorderSide(
                  color: ColorConstant.bluegray100,
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: ColorConstant.whiteA700,
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: getHorizontalSize(
                  18.00,
                ),
                top: getVerticalSize(
                  12.00,
                ),
                right: getHorizontalSize(
                  30.00,
                ),
                bottom: getVerticalSize(
                  12.00,
                ),
              ),
            ),
            style: TextStyle(
              color: ColorConstant.gray400,
              fontSize: getFontSize(
                12.0,
              ),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: getVerticalSize(
            21.00,
          ),
          right: getHorizontalSize(
            10.00,
          ),
        ),
        child: Text(
          "Upload Photo",
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
      GestureDetector(
        onTap: (){
          _showpicker();
        },
        child:_image != null
            ? Container(
          height: getVerticalSize(
            50.00,
          ),
          width: getHorizontalSize(
            150.00,
          ),
          margin: EdgeInsets.only(
            top: getVerticalSize(
              13.00,
            ),
          ),
          child: Image.file(
            File(_image!.path),
            fit: BoxFit.fill,
          ),
        ):
        Container(
          height: getVerticalSize(
            39.00,
          ),
          width: getHorizontalSize(
            320.00,
          ),
          margin: EdgeInsets.only(
            top: getVerticalSize(
              13.00,
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
              color: ColorConstant.bluegray100,
              width: getHorizontalSize(
                1.00,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 230),
            child: Icon(Icons.file_present_rounded,size: 20,color: Colors.blueGrey,),
          ),

        ),
      ),
      Container(
        width: getHorizontalSize(
          307.00,
        ),
        margin: EdgeInsets.only(
          top: getVerticalSize(
            21.00,
          ),
          right: getHorizontalSize(
            10.00,
          ),
        ),
        child: Text(
          "Kindly upload 3-4 min playing tennis video along with \nyour introduction",
          maxLines: null,
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
      if(_video != null)
        _videoPlayerController!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _videoPlayerController!.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController!),
        )
            : Container()
      else
        GestureDetector(
          onTap: () {
            _pickVideo();
          },
          child: Container(
            height: getVerticalSize(
              80.00,
            ),
            width: getHorizontalSize(
              130.00,
            ),
            margin: EdgeInsets.only(
              top: getVerticalSize(
                21.00,
              ),
              right: getHorizontalSize(
                10.00,
              ),
            ),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: ColorConstant.whiteA700,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConstant.bluegray100,
                  width: getHorizontalSize(
                    1.00,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          40.00,
                        ),
                        top: getVerticalSize(
                          23.33,
                        ),
                        right: getHorizontalSize(
                          40.00,
                        ),
                        bottom: getVerticalSize(
                          23.34,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          33.33,
                        ),
                        width: getSize(
                          33.33,
                        ),
                        child: Image.asset(
                          "assets/images/upload.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      Padding(
        padding: EdgeInsets.only(
          top: getVerticalSize(
            50.00,
          ),
        ),
        child: GestureDetector(onTap: (){
          AppicationformApi.getacademyregistration(context, designatioids, NameController.text, DateOfBiirthController.text, "female", AddressController.text, Mobilenumbercontroller.text, EmailController.text, "age_weight.png", "videoblocks-4k-fat-to-fit-weight-loss-3d-stock-animation-plus-sized-to-lean-muscular-before-after-transformation-male-fitness-4096-x-2304-dci-4k-version-4_rt1q28ueb__SB_PM.mp4");

        },
          child: Container(
            alignment: Alignment.center,
            height: getVerticalSize(
              42.00,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: ColorConstant.orange900,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
            ),
            child: Text(
              "Submit",
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
    ],
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
  }
  _pickVideo() async {
    PickedFile? pickedFile = await _picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_) {
      setState(() { });
      _videoPlayerController!.play();
      videoPath =_video!.path;
      print("_videopath->>>>>>>>>>>>${_video!.path}");
    });
  }
  _imagefromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      ImgPath =_image!.path;
      print("Path >.........${_image!.path}");
    });
  }

  _imagefromComera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
    });
  }

  _showpicker() {
    showModalBottomSheet(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _imagefromComera();
                        },
                        icon: Icon(Icons.camera_alt_rounded,
                            color: Colors.orangeAccent),
                        iconSize: 30,
                      ),
                      Text("Camera"),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _imagefromGallery();
                        },
                        icon: Icon(Icons.photo),
                        color: Colors.indigo,
                        iconSize: 30,
                      ),
                      Text("Gallery"),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }

}
  String dropdownvalue = 'Select';
  class MyHomePage14 extends StatefulWidget {
    @override
    _MyHomePageState14 createState() => _MyHomePageState14();
  }

  class _MyHomePageState14 extends State<MyHomePage14> {
    late final Function()? onChanged;
    var items = [
      'Select',
      'Female',
      "Male",
      "Others",
    ];



    @override
    Widget build(BuildContext context) {
      return Container(
        width: 200,
        height: 25,
        margin: EdgeInsets.only(left:8),

        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: dropdownvalue,
            hint: Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
                print("value->..>>..>>>>>${dropdownvalue}");
              });
            },
          ),
        ),
      );
    }
  }