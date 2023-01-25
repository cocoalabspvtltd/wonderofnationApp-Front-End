import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oo/apis/repositories/academy_registration_repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';

import '../dropdowns/games_dropdown.dart';
import 'application_form_Submitted.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'home_page1.dart';

class ApplicationFormScreen extends StatefulWidget {
  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  File? _image;
  File? _video;
  File? ImgPath;
  VideoPlayerController? _videoPlayerController;
  AcademyRegistrationRepository AppicationformApi =
      AcademyRegistrationRepository();
  final ImagePicker _picker = ImagePicker();

  String dropdownvalue = 'Select';

  String videoPath = "";
  late final Function()? onChanged;

  File? imageFile;

  TextEditingController NameController = TextEditingController();

  TextEditingController DateOfBiirthController = TextEditingController();

  TextEditingController AddressController = TextEditingController();

  TextEditingController Mobilenumbercontroller = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  List<String> gender = [
    "Female",
    "Male",
    "others",
  ];

  List<String> sport = [
    "Tennis",
    "Football",
    "Cricket",
    "Swimming",
    "Badminton",
    "Golf"
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: SafeArea(
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
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
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
                                    14,
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
                                  color: ColorConstant.black900,
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
                                child: DesignationDropdown(),
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
                                    14,
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
                                  decoration: InputDecoration(
                                    hintText: 'Andria Jacob',
                                    hintStyle: TextStyle(
                                      fontSize: getFontSize(
                                        14.0,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your name';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14.0,
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
                                    14,
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
                                  decoration: InputDecoration(
                                    hintText: 'YYYY/MM/dd',
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                  validator: (value){
                                    if (value!.isEmpty) {
                                      return 'Please a Enter Date of birth';
                                    }
                                    if (!RegExp('^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])')
                                        .hasMatch(value)) {
                                      return 'Please a Enter Date of birth';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14.0,
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
                                    14,
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
                                  color: ColorConstant.black900,
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
                                  child: MyHomePage14()),
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
                                    14,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please a Enter valid address';
                                    }
                                    if (!RegExp(r'^[a-zA-Z0-9\.\-\s\,\/]+$')
                                        .hasMatch(value)) {
                                      return 'Please a Enter valid address';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14.0,
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
                                    14,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                  validator: (value) {
                                    if (value?.length != 10)
                                      return 'Mobile Number must be of 10 digit';
                                    else
                                      return null;
                                  },
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14.0,
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
                                    14,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                        color: ColorConstant.black900,
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
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please a Enter';
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return 'Please a valid Email';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14.0,
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
                                    14,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: _image != null
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
                                    )
                                  : Container(
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
                                          color: ColorConstant.black900,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 230),
                                        child: Icon(
                                          Icons.file_present_rounded,
                                          size: 20,
                                          color: ColorConstant.black900,
                                        ),
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
                                    13,
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            if (_video != null)
                              _videoPlayerController!.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio: _videoPlayerController!
                                          .value.aspectRatio,
                                      child:
                                          VideoPlayer(_videoPlayerController!),
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
                                        color: ColorConstant.black900,
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
                                                color: ColorConstant.black900,
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
                              child: GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print("Form was Submitted Successfully");
                                  }
                                  await AppicationformApi
                                      .getacademyregistration(
                                          context,
                                          designatioids.toString(),
                                          NameController.text,
                                          DateOfBiirthController.text,
                                          "female",
                                          AddressController.text,
                                          Mobilenumbercontroller.text,
                                          EmailController.text,
                                          _image!,
                                          _video!);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: getVerticalSize(
                                    42.00,
                                  ),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.green6320,
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
      ),
    );
  }

  _pickVideo() async {
    PickedFile? pickedFile =
        await _picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile!.path);
    print("video=>>>$_video");
    videoPath = _video!.path;
    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
        videoPath = _video!.path;
        print("_videopath->>>>>>>>>>>>${_video!.path}");
      });
  }

  // _imagefromGallery() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //     ImgPath = _image!.path ;
  //     print("Path >.........${_image}");
  //     print("Path >.........${ImgPath}");
  //   });
  // }

  // _imagefromComera() async {
  //   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = photo;
  //   });
  // }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _image = File(image.path);
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
                          //  _imagefromComera();
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
                          //_imagefromGallery();
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
      margin: EdgeInsets.only(left: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropdownvalue,
          hint: Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(color: ColorConstant.black900, fontSize: 14),
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
