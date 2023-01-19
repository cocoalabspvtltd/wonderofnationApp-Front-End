import 'package:dio/dio.dart';
import 'package:oo/apis/modelclass/follow_modelclass.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/web_Api_provider.dart';
class FollowRepository {


  WebApiProvider apiProvider = WebApiProvider();

  Future getFollowing(int page,int perPage) async {
    FormData formData = FormData.fromMap({
      "page": page,
      "per_page": perPage,
    });

    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl + "following",
        data: formData,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': "Bearer " + TOKEN,
            }
        )
    );
    print("---------->${response.data}");
    return FollowModelClass.fromJson(response.data);
  }

  Future getFollowers(int page,int perPage) async {
    FormData formData = FormData.fromMap({
      "page": page,
      "per_page": perPage,
    });

    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl + "followers",
        data: formData,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': "Bearer " + TOKEN,
            }
        )
    );
    print("---------->${response.data}");
    return FollowModelClass.fromJson(response.data);
  }
  Future getUserFollowers(int page,int perPage,id) async {
    FormData formData = FormData.fromMap({
      "page": page,
      "per_page": perPage,
      "user_id":id
    });
    print("user->${formData.fields}");

    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl + "followers",
        data: formData,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': "Bearer " + TOKEN,
            }
        )
    );
    print("---------->${response.data}");
    return FollowModelClass.fromJson(response.data);
  }


  Future getUserFollowing(int page,int perPage,id) async {
    FormData formData = FormData.fromMap({
      "page": page,
      "per_page": perPage,
      "user_id":id
    });

    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl + "following",
        data: formData,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': "Bearer " + TOKEN,
            }
        )
    );
    print("---------->${response.data}");
    return FollowModelClass.fromJson(response.data);
  }

}
