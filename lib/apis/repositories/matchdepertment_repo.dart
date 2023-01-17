
import 'package:dio/dio.dart';
import 'package:oo/apis/modelclass/matchdescription_modelk.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/web_Api_provider.dart';

import '../../constants/base_urls.dart';

class DepartmentRepositoryUser {
  late WebApiProvider apiProvider;

  DepartmentRepositoryUser() {
    print("dgvdfr");
    apiProvider = new WebApiProvider();
  }

   getAllDepartmentList(int id
    ) async {
    print("respos->>>>>${id}");
    FormData formData = FormData.fromMap({
     "match_id":id
    });
    try {
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"booking/details", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("respos->>>>>$response");
    return MatchDescriptionModel.fromJson(response.data);
  }catch (error) {
      print("error");
      print(error.toString());
    }
}}
