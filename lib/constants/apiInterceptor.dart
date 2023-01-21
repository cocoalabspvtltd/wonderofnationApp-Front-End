import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../user.dart';
import 'sharedpref.dart';


class ApiInterceptor extends Interceptor {
  int maxCharactersPerLine = 500;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (User.apiToken.isNotEmpty) {
      if (!options.headers.containsKey('authorization')) {
        options.headers.addAll({"Authorization": "Bearer ${User.apiToken}"});
      }

      // options.headers.addAll({"Authorization": "Bearer $s1"});
    }

    print("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    print(
        "REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    // ignore: unnecessary_null_comparison
    if (options.queryParameters != null) {
      print("QueryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      try {
        print('body:');
        FormData d = options.data;
        d.fields.forEach((element) {
          print('${element.key}:${element.value}');
        });
      } catch (e) {
        print("${options.data}");
      }
    }
    print("!!!!!!!!!!!!!!!!!!!! Request End !!!!!!!!!!!!!!!!!!!!!");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("************** Response Begin ************************");
    print("ResMethodType : [${response.requestOptions.method}]");
    print(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}");
    if (response.statusCode == 401) {
      SharedPrefs.logOut();
      Fluttertoast.showToast(msg:'Unauthorized');
    }

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            '''${responseAsString.substring(i * maxCharactersPerLine, endingIndex)}''');
      }
    } else {
      print('''${response.data}''');
    }
    print("************** Response End ************************");

    // print('status code: ${response.statusCode}');
    // print('success response: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("#################### Error Begin #########################");
    if (err.response != null) {
      print('status code: ${err.response!.statusCode}');
      print('error response: ${err.response!.data.toString()}');
      Fluttertoast.showToast(msg:err.response!.data['message']);

      if (err.response!.statusCode == 401) {
        SharedPrefs.logOut();
      }
    } else {
      print('${err.toString()}');
    }
    print("#################### Error End #########################");

    super.onError(err, handler);
  }
}
