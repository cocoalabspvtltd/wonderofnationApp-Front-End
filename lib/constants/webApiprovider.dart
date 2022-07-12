import 'package:dio/dio.dart';

import 'baseurls.dart';


class WebApiProvider {
  Dio _dio = Dio();
  final String _endpoint = baseurl1;

  WebApiProvider() {
    BaseOptions options =
    BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    _dio = Dio(options);

  }

  Future<dynamic?> getData( {
    required String url,
    required bool isPost,
    String? token,

    Map<String, dynamic>? queryParameters,
    required bool isQueryParmeter,
    String? summerpath,
  }) async {
    // dynamic? user;
    Response? response;
    try {
      _dio.options.headers['content-Type'] = 'application/json;encoding=utf-8';
      if (token != null && token != "") {
        print("tken called");
        _dio.options.headers["authorization"] = "Bearer ${token}";
      } else {
        _dio.options.headers['Content-Type'] =
        'application/x-www-form-urlencoded';
        //_dio.options.headers["Authorization"] = null;
        _dio.options.headers["Access-Control-Allow-Origin"] =
        "*"; // Required for CORS support to work
        _dio.options.headers["Access-Control-Allow-Credentials"] =
        "true"; // Required for cookies, authorization headers with HTTPS
        _dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
        _dio.options.headers["Access-Control-Allow-Methods"] = "POST, OPTIONS";
      }
      if (summerpath != "" && summerpath != "") {
        _dio.options.headers['Content-Type'] =
        'application/json;encoding=utf-8';
        _dio.options.headers["summerpath"] = "$summerpath";
      }

      if (isPost) {
        if (isQueryParmeter) {
          response = await _dio.post("https://" + _endpoint + url,
              data: queryParameters);
        } else {
          response = await _dio.post("https://" + _endpoint + url);
        }
      } else {
        if (isQueryParmeter) {
          response = await _dio.get("http://" + _endpoint + url,
              queryParameters: queryParameters);
        } else {
          response = await _dio.get("http://" + _endpoint + url);
        }
      }

      print('User Response: ${response.toString()}');
      print('User Info: ${response.data}');

      try{

      }
      catch(ex){
        //    print("Error occured in 401 checking : "+ ex.toString());
      }
      // if(!url.contains("userMenu")) {

      // if (response.data["code"].toString() == "401") {
      //   print('User statusCode inside: ${response.data["code"]}');
      //   await accessToken();
      // }
      // }
      /// user = UserToken.fromJson(userData.data);
    } on DioError catch (e) {
      print("errrorr : " + e.toString());
      _handleError(e);
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return response!.data;
  }

  Future<String> _handleError(DioError error) async {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;

      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response!.statusCode}";

          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }


}