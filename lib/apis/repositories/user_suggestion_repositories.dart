import 'dart:async';

import 'package:dio/dio.dart';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/user.dart';
import '../../constants/base_urls.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/user_suggestion_model.dart';

int club_id = 0;
class UserSuggestionRepository {

  WebApiProvider apiProvider = WebApiProvider();

  getUsersuggestionList(int per_page, page ) async {
    FormData formData = FormData.fromMap({
      "page":page,
      "per_page":per_page

    });
    try {
      final resoponse = await apiProvider
          .getJsonInstance()
          .post(baseurl + "suggested-users",data: formData,options: Options(headers:{
        'Accept':'application/json',
        'Authorization':"Bearer " + UserDetails.apiToken,

      }));

      print("=???${resoponse.data}");
      return UserSuggestionModel.fromJson(resoponse.data);
    }catch(error){
      print("error");
      print(error.toString());
    }

  }
}
