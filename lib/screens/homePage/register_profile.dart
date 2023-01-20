import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/apis/repositories/profile_page_repositories.dart';
import '../../constants/colors.dart';
import '../../constants/math_utils.dart';
import '../dropdowns/game_list_register.dart';
import 'levelling_Register1.dart';

class RegisterProfile extends StatefulWidget {
  const RegisterProfile({
    Key? key,
    required this.names,
  }) : super(key: key);
  final String names;
  void initState() {}
  @override
  State<RegisterProfile> createState() => _RegisterProfileState();
}

class _RegisterProfileState extends State<RegisterProfile> {
  File? image;
  File? imageTemp;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

       imageTemp = File(image.path);

      setState(() => this.image = imageTemp);

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  ProfilepageRepositories profileimageupload = ProfilepageRepositories();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          112.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hai ',
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
                                    text: " ${widget.names.toUpperCase()}",
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  60.00,
                                ),
                                top: getVerticalSize(
                                  13.00,
                                ),
                                right: getHorizontalSize(
                                  56.00,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Complete your profile to start playing",
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              top: getVerticalSize(
                                51.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  20.00,
                                ),
                                top: getVerticalSize(
                                  51.00,
                                ),
                                right: getHorizontalSize(
                                  20.00,
                                ),
                              ),
                              child: InkWell(
                                onTap: pickImage,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 48.0,
                                  child: CircleAvatar(
                                    radius: 48.0,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      height: 150,
                                      child: ClipOval(
                                        child: (image != null)
                                            ? Image.file(
                                                image!,
                                                fit: BoxFit.fill,
                                              )
                                            : Image.asset(
                                                'assets/images/profile.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  20.00,
                                ),
                                right: getHorizontalSize(
                                  20.00,
                                ),
                                top: 15),
                            child: GestureDetector(
                              onTap: () async{

                              await  profileimageupload.getprofileImageList(imageTemp!);
                                //uploadImage(image!);
                              },
                              child: Text(
                                "Upload your photo",
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
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              top: getVerticalSize(
                                50.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child: Text(
                              "Select your favourite sport",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.green6320,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10.0,right: 10,top: 60),
                          //   child: Container(width: 400,
                          //       decoration: BoxDecoration(
                          //         color: ColorConstant.whiteA700,
                          //         borderRadius: BorderRadius.circular(
                          //           getHorizontalSize(
                          //             5.00,
                          //           ),
                          //         ),
                          //         border: Border.all(
                          //           color: ColorConstant.bluegray100,
                          //           width: getHorizontalSize(
                          //             1.00,
                          //           ),
                          //         ),
                          //       ),
                          //       child: designationdropdown1()),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                                height: getVerticalSize(
                                  53.00,
                                ),
                                width: getHorizontalSize(
                                  300.00,
                                ),
                                margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      9.00,
                                    ),
                                    top: 60),
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
                                child: DesignationDropDown()),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              top: getVerticalSize(
                                100.00,
                              ),
                              right: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LevelingFirst(
                                            designatioids1,
                                            user1: widget.names,
                                          )),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  42.00,
                                ),
                                width: getHorizontalSize(
                                  320.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.green6320,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      5.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _buildImageSection() {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 20),
  //     alignment: FractionalOffset.center,
  //     width: double.infinity,
  //     height: 150,
  //     color: Colors.transparent,
  //     child: Container(
  //       height: 150.0,
  //       width: 150.0,
  //       child: Stack(children: <Widget>[
  //         Container(
  //           width: 150,
  //           height: 150,
  //           decoration: new BoxDecoration(
  //             color: Colors.black26,
  //             borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
  //             border: new Border.all(
  //               color: Colors.grey,
  //               width: 4.0,
  //             ),
  //           ),
  //           child: ClipOval(
  //             child: SizedBox.expand(
  //               child: showImage(),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           child: Align(
  //             alignment: FractionalOffset.bottomRight,
  //             child: GestureDetector(
  //               child: Image.asset(
  //                 ('assets/images/ic_camera.png'),
  //                 height: 50,
  //                 width: 50,
  //               ),
  //               onTap: () async {
  //                 final pickedFile = await ImagePicker().pickImage(
  //                     source: ImageSource.gallery,
  //                     imageQuality: 60);
  //
  //                 if(pickedFile!=null){
  //                   image = XFile(pickedFile.path);
  //                   setState(() {  });
  //                 }
  //               },
  //             ),
  //           ),
  //         )
  //       ]),
  //     ),
  //   );
  // }
  // Widget showImage() {
  //   return Center(
  //     child: image == null
  //         ? CachedNetworkImage(
  //       width: double.infinity,
  //       height: double.infinity,
  //       fit: BoxFit.cover,
  //       placeholder: (context, url) => CircularProgressIndicator(),
  //       errorWidget: (context, url, error) => Center(
  //         child: Image(
  //           image:
  //           AssetImage('assets/images/ic_avatar.png',),color: Colors.white,
  //         ),
  //       ), imageUrl: '',
  //     )
  //         : Container(
  //       height: 140.0,
  //       width: 140.0,
  //       child: SizedBox.expand(
  //         child: Image.file(
  //           image!,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       decoration: BoxDecoration(
  //         borderRadius: new BorderRadius.all(const Radius.circular(70.0)),
  //       ),
  //     ),
  //   );
  // }
  // XFile? _image;
  // _imagefromGallery() async {
  //   final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  //   await profileimageupload.getprofileImageList(_image!);
  // }
  //
  // _imagefromComera() async {
  //   final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = photo;
  //   });
  //   await profileimageupload.getprofileImageList(_image!);
  // }
  // _showpicker() {
  //   showModalBottomSheet(
  //       shape:
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //       backgroundColor: Colors.white,
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: 100,
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Column(
  //                   children: [
  //                     SizedBox(width: 100),
  //                     CircleAvatar(
  //                       radius: 24,
  //                       backgroundColor: Colors.green[900],
  //                       child: IconButton(
  //                         onPressed: () {
  //                           _imagefromComera();
  //                         },
  //                         icon: Icon(Icons.camera_alt_rounded,
  //                             color: Colors.white),
  //                         iconSize: 30,
  //                       ),
  //                     ),
  //                     Text("Camera"),
  //                   ],
  //                 ),
  //                 SizedBox(width:100),
  //                 Column(
  //                   children: [
  //                     CircleAvatar(
  //                       radius: 24,
  //                       backgroundColor: Colors.green[900],
  //                       child: IconButton(
  //                         onPressed: () {
  //                           _imagefromGallery();
  //                         },
  //                         icon: Icon(Icons.photo),
  //                         color: Colors.white,
  //                         iconSize: 30,
  //                       ),
  //                     ),
  //                     Text("Gallery"),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}
