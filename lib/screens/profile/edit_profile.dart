import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../apis/repositories/edit_profile.dart';
import '../../apis/repositories/profile_page_repositories.dart';
import '../../constants/colors.dart';

var image ;
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.UserName, required this.UserEmail, required this.UserPhone,required this.UserPic}) : super(key: key);
final String UserName;
final String UserEmail;
final String UserPhone;
final String UserPic;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController NameController = TextEditingController();
  TextEditingController BioController  = TextEditingController();
  TextEditingController Mobilenumbercontroller  = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  EditprofileRepostory editProfileApi = EditprofileRepostory();
  ProfilepageRepositories getedit = ProfilepageRepositories();
  @override

  final ImagePicker _picker = ImagePicker();

String imagpath = "";
  void initState() {
    super.initState();
  NameController.text = widget.UserName;
  Mobilenumbercontroller.text=widget.UserPhone;
    EmailController.text=widget.UserEmail;
    setState(() {});
  }
  File? image;
  late File imageTemp;
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
  Widget build(BuildContext context) {
    // NameController.text = widget.UserName;
    // EmailController.text = widget.UserEmail;
    // Mobilenumbercontroller.text = widget.UserPhone;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Edit Profile",style: TextStyle(color: ColorConstant.black901,fontSize: 17),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.close,size: 20,color: ColorConstant.black901)),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 17,right: 10),
              child: Text("Save",style: TextStyle(color: ColorConstant.green6320,fontSize: 15),),
            ),
            onTap: () {

             // print("image=>${image}");
       getedit.getEditprofile(context,
           EmailController.text.isEmpty? widget.UserName:NameController.text,
           EmailController.text.isEmpty?widget.UserEmail:EmailController.text,
           Mobilenumbercontroller.text.isEmpty?widget.UserPhone:Mobilenumbercontroller.text, BioController.text,imageTemp);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Center(
                child: InkWell(
                  onTap:
                     pickImage,
                  child: Container(
                    height: 130,
                    width: 150,
                    child: Stack(children: [
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
                            child: image==null?
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: '${widget.UserPic}',
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => CircleAvatar(
                                radius: 46.0,
                                backgroundImage:
                                AssetImage('assets/images/profile.png'),
                                backgroundColor: Colors.grey,
                              ),
                        ):
                            Center(
                                child:  InkWell(
                                  onTap: pickImage,
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage: image == null ? null
                                        :FileImage(File(image!.path)),
                                    child: image==null ?
                                    Image.asset(
                                        'assets/images/profile.png') :
                                    Text("") ,
                                  ),
                                )
                            ),
                      ),
                      ),
                      ),
                    ]),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Text("Name",style: TextStyle(color: ColorConstant.black901,fontSize: 15,),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 15,top: 5),
                child: TextFormField(
                  cursorHeight: 20,
                  controller: NameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Text("Email",style: TextStyle(color: ColorConstant.black901,fontSize: 15,),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 15,top: 5),
                child: TextFormField(
                  cursorHeight: 20,
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Text("Mobile No",style: TextStyle(color: ColorConstant.black901,fontSize: 15,),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 15,top: 5),
                child: TextFormField(
                  cursorHeight: 20,
                  controller: Mobilenumbercontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Text("Bio",style: TextStyle(color: ColorConstant.black901,fontSize: 15,),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 15,top: 5),
                child: TextFormField(
                  cursorHeight: 20,
                  // maxLength:100,
                  controller: BioController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.gray600),
                    ),
                    hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nPulvinar cursus mi diam suspendisse a in non cursus.",
                    hintStyle: TextStyle(fontSize: 12,color: Colors.black),
                    hintMaxLines: 2,
                  ),


                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  // _imagefromGallery() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  //
  // _imagefromComera() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     imageTemp = File(image.path);
  //     setState(() { this.image = imageTemp;
  //     }
  //     );
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
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
  //                     IconButton(
  //                       onPressed: () {
  //                         _imagefromComera();
  //                       },
  //                       icon: Icon(Icons.camera_alt_rounded,
  //                           color: Colors.orangeAccent),
  //                       iconSize: 30,
  //                     ),
  //                     Text("Camera"),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: 30,
  //                 ),
  //                 Column(
  //                   children: [
  //                     IconButton(
  //                       onPressed: () {
  //                         _imagefromGallery();
  //                       },
  //                       icon: Icon(Icons.photo),
  //                       color: Colors.indigo,
  //                       iconSize: 30,
  //                     ),
  //                     Text("Gallery"),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: 30,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}
