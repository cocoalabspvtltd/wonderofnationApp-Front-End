import 'dart:async';

import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/web_Api_provider.dart';
import '../modelclass/user_suggestion_model.dart';

int club_id = 0;
class UserSuggestionRepository {

  Future  getUsersuggestionList() async {
    print("token=${TOKEN}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url:"suggested-users",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>${response}");

   return  (response as List)
       .map((x) => UserSuggestionModel.fromJson(x))
       .toList()
        ;
  }
}
