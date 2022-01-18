
import 'package:dio/dio.dart';

class DioHelpear {
  static late Dio dio;

  static initial() {
    dio = Dio(BaseOptions(
      baseUrl: "http://45.35.169.130:8765/GRIP_API_Test/api/",
      receiveDataWhenStatusError: true,));
  }

}
