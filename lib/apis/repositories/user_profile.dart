// import 'dart:async';
// import 'dart:io';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:oo/apis/repositories/register_Repositories.dart';
// import '../../constants/web_Api_provider.dart';
// import '../modelclass/joined_club_Model.dart';
//
//
// class profileRepository {
//
//   Future  getProfile(File profilePicture) async {
//     print("token=${TOKEN}");
//     String fileName = profilePicture.path.split('/').last;
//     final Map<String, dynamic> _queryParameters = <String, dynamic>{
//       "profile_pic": http. MultipartFile.fromBytes(profilePicture.path, filename: fileName),
//     };
//     print("_queryParameters : " + _queryParameters.toString());
//
//     final response = await WebApiProvider().getData(
//         url: "profile",
//         isPost: true,
//         token: TOKEN,
//         queryParameters: _queryParameters,
//         isQueryParmeter: true);
//     print("res->>>${response}");
//
//
//     return (response as List)
//         .map((x) => JoinedClubModel.fromJson(x))
//         .toList();
//   }
// }
