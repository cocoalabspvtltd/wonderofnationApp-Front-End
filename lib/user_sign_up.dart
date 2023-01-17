// import 'package:naturopathy/models/user/user_details.dart';
//
// class UserSignUpResponse {
//   int? statusCode;
//   bool? success;
//   String? message;
//   UserDetails? userDetails;
//   String? apiToken;
//
//   UserSignUpResponse(
//       {this.statusCode,
//         this.success,
//         this.message,
//         this.userDetails,
//         this.apiToken});
//
//   UserSignUpResponse.fromJson(dynamic json) {
//     statusCode = json["status_code"];
//     success = json["success"];
//     message = json["message"];
//     userDetails = success! && json["user_details"] != null
//         ? UserDetails.fromJson(json["user_details"])
//         : null;
//     apiToken = json["token"];
//   }
// }
