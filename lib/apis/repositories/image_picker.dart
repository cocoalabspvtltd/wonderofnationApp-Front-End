

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/base_urls.dart';



class ImagePicker {
Future<String> updateUserImage(XFile? file) async {

  String fileName = file!.path.split('/').last;
  FormData formData = FormData.fromMap({

    "image": await MultipartFile.fromFile(file.path, filename: fileName),
  });

  final response = await Dio().post("${baseurl}profile", data: formData);
  print(response.data);
  return response.data['message'];
}}