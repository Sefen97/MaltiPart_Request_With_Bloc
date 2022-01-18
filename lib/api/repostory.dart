import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_muliti_part/api/add_file_request.dart';
import 'package:test_muliti_part/api/add_file_response.dart';
import 'package:test_muliti_part/api/dio.dart';
import 'package:test_muliti_part/bloc/file_request_bloc.dart';

class Repostory {
  static Future<FileRequestState> addTask() async {
    FileRequestState? fileRequestState;

    try {
      Response? response = await DioHelpear.dio
          .post("Tasks/Users/Taskscapture", data: _postRequest());
      if (response.statusCode == 200) {
        AddFileResponse addFileResponse = AddFileResponse.fromJson(response.data);
        return FileRequestSuccessState(response: addFileResponse);
      }
    } catch (e) {
      return FileRequestErrorState(error: "$e");
    }
    return fileRequestState!;
  }
}

_postRequest() {
  String? imageFilePath = "assets/image.png";
  String? imageName = "image";
  FormData formData = FormData();
  formData.files.add(MapEntry(
      'file', MultipartFile.fromString(imageFilePath, filename: imageName)));
  formData.fields.add(MapEntry(
      "RequestBody",
      jsonEncode(AddFileRequest(
          userID: 145,
          taskID: 0,
          remarks: "hello",
          longitude: 1.2,
          latitude: 20.6))));
  return formData;
}
