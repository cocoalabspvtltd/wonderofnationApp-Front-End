import 'package:flutter/material.dart';
import'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/screens/homePage/home_page1.dart';
import '../../constants/web_Api_provider.dart';
import '../../screens/dropdowns/games_dropdown.dart';


class AcademyRegistrationRepository {
  WebApiProvider apiProvider = WebApiProvider();
  Future getacademyregistration(context, String sportid, String Name, dateofbirth,
      gender, address, phone, email, File img, File video) async {
    String videoname = video.path.split('/').last;
    String imgname = img!.path.split('/').last;
   var imge =  await MultipartFile.fromFile(img.path, filename: imgname);
   var vido=  await MultipartFile.fromFile(video.path, filename: videoname);
   print("img->$imge");
   print("vido->$vido");
    FormData formData = FormData.fromMap({
      "sport_id": designatioids,
      "name": Name,
      "dob": dateofbirth,
      "gender": gender,
      "address": address,
      "phone": phone,
      "email": email,
      "img":imge,
      "video":vido,
    });
    print("formdata->>>>>${formData.fields}");
    final response = await apiProvider.getMultipartInstance().post(baseurl+"store/applicant",
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer"+TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response}");
    if (response.statusCode==200){
      return Fluttertoast.showToast(msg:"Application Submitted");

    };

    return response;
  }


}
