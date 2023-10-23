//api
import 'package:dio/dio.dart';
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY
class DioHelper  {

  static Dio? dio;

  static inti()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response?> getData({required String path,
  required  Map<String, dynamic> queryParameters,
  })async
  {
    //v2/top-headlines
    //{"country":"eg","category":"business","":""}
    return await dio?.get(path,queryParameters:queryParameters);
  }
}
