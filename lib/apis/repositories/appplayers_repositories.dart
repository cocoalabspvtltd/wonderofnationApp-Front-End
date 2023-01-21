import 'package:dio/dio.dart';
import 'package:oo/apis/modelclass/ResultModel.dart';
import 'package:oo/apis/modelclass/addplayers_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';
import 'package:oo/constants/user.dart';

import '../../constants/web_Api_provider.dart';


class AddplayerRepository {



  WebApiProvider apiProvider= WebApiProvider();

  Future getAddplayersRepository(int page ,perpage) async {

    FormData formData = FormData.fromMap({
      "page":perpage,
      "per_page":page
    });
    print("data-0>${formData.fields}");
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"players", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return AddPlayersModel.fromJson(response.data);

  }

  Future getResultplayersRepository(int page ,perpage) async {

    FormData formData = FormData.fromMap({
      "page":perpage,
      "per_page":page
    });
    print("data-0>${formData.fields}");
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"player/results", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetails.apiToken,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return ResultModelClass.fromJson(response.data);

  }


}