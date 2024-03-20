import 'package:dio/dio.dart';
import 'constant.dart';

class DioHelper {
  static late Dio dio;
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00
// https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00
// https://newsapi.org/v2/everything?country=eg&category=sports&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "content-Type": "application/json",
          "Accept": "application/json"
        },
        receiveDataWhenStatusError: true));
  }

  // 1- get
  // 2- post
  // 3- put
  // 4- delete
//  https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00

static  getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''}"};
      Response response =
          await dio.get(url, queryParameters: query, data: data);
      print("response ${response.data}  status ${response.statusCode}");
      return response;
    } catch (error) {
      print(error);
    }
  }

  postData(
      {String? token,
      required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    try {
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''}"};
      var response = await dio.post(url, queryParameters: query, data: data);
      print("response ${response.data} status ${response.statusCode}");
      return response;
    } catch (error) {
      print(error);
    }
  }


  putData(){}
}
