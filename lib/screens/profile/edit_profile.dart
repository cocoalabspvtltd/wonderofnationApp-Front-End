import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oo/constants/user.dart';
import 'package:oo/screens/homePage/register.dart';
import 'package:oo/screens/profile/profile_page.dart';

import '../../apis/repositories/edit_profile.dart';
import '../../constants/colors.dart';






XFile? _image;
var image ;
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.UserName, required this.UserEmail, required this.UserPhone}) : super(key: key);
final String UserName;
final String UserEmail;
final String UserPhone;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController NameController = TextEditingController();
  TextEditingController BioController  = TextEditingController();
  TextEditingController Mobilenumbercontroller  = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  EditprofileRepostory editProfileApi = EditprofileRepostory();
  void initState() {
    super.initState();
    NameController.text = widget.UserName;
    setState(() {});
  }
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
              image =  _image?.path;
       editProfileApi.getEditprofile(context,
           EmailController.text.isEmpty? widget.UserName:NameController.text,
           EmailController.text == null?UserDetails.userEmail:EmailController.text,
           Mobilenumbercontroller.text==null?UserDetails.userMobile:Mobilenumbercontroller.text, BioController.text,imagpath);
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
                child:  GestureDetector(
                  onTap: (){
                    _showpicker();
                  },
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: ColorConstant.gray400,
                    backgroundImage: _image == null ? null
                        :FileImage(File(_image!.path)),
                    child: _image==null ? Icon(Icons.camera_alt,color: ColorConstant.black901,size: 30,) : null,
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
  _imagefromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      imagpath = _image!.path;
      print("image->${_image!.path}");
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
