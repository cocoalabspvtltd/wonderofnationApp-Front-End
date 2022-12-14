import 'package:dio/dio.dart';
import 'package:oo/apis/modelclass/addplayers_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import 'package:oo/constants/base_urls.dart';

import '../../constants/web_Api_provider.dart';

class AddplayerRepository {



  WebApiProvider apiProvider= WebApiProvider();

  Future getAddplayersRepository() async {

    FormData formData = FormData.fromMap({
      "page":"0",
      "per_page":"20"
    });
    final response = await apiProvider
        .getJsonInstance()
        .post(baseurl+"players", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + TOKEN,
            }
        )

    );
    print("->>>>>>>>>>>${response.data}");
    return AddPlayersModel.fromJson(response.data);

  }
}