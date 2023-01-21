import 'package:oo/apis/modelclass/user_details.dart';
import 'package:oo/apis/repositories/paymentcucesss.dart';

class UserSignInModel {
  bool?success;
  String? message;
  User? user;
  String? token;

  UserSignInModel({this.message, this.user, this.token});

  UserSignInModel.fromJson(Map<String, dynamic> json) {
    success =json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data["success"] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
