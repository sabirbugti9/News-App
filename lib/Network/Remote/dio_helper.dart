//api link:
//https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca //search api
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=7c92828fc6864a23be554a121218f0db

//https://newsapi.org/v2/everything?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca


// base url(Web Server Link): https://newsapi.org/
// method (url): v2/top-headlines
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// apikey7c92828fc6864a23be554a121218f0db

import 'package:dio/dio.dart';
class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getHttp({
    required String url,
     Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);


  }
}