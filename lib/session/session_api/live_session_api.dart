import 'package:dio/dio.dart';
import 'package:getx_project/session/models/live_session_model.dart';

class LiveSessionApiService {
  static final Dio _dio = Dio();
  static String url = "https://api.toppersnotes.com/api/v2/session/live/2763/";

  static Future addInterceptors(Dio dio) async {
    return dio.interceptors
        .add(InterceptorsWrapper(onRequest: (request, handler) {
      request.headers["Authorization"] =
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTVkN2JkZTg1ZjdlOWYxOWJhZjk0OTQwMWY1NzY5NjM5OGQ3OGI3YTZiNzUxOTc4NjdiZjY0MmM2MWMyYzY1MjU0MGZmNzViNTAwNzRiMWYiLCJpYXQiOiIxNjI5MzUxMDc5LjEyMDkwMCIsIm5iZiI6IjE2MjkzNTEwNzkuMTIwOTAzIiwiZXhwIjoiMTY2MDg4NzA3OS4xMTYxMTAiLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.NxvT6255n-U1Iz4IOWitM2W8qA0aRfbq3uLpl_TSamNSL-wP3lYYvdhaJ6zB0t2WdErL0EadLhp6qiI4PvVKSnoBYcvwI45coDJ2RQMl0WjxEWlacEFzbWRaE9tX6q321aqWfkCnpY94Yk_49SdEAZt6I__N1ElD_F2azdrEUjFYjZhnovBNkSk8U8qD4LyqY6ythkJ2P46AXMrFzxPbRapwQBUmzPzClZbSpYHB4iI6hF6MIergyJLESHlJUmjPJwq79KL2S_Ad3U2J91TxzIJsZGn0qV426kGcF5L96pPZxhlyoz_lgUV6jGc9UB0PzrwDHIlzvf4NznWzLBpyIne_EHwITOR74HJh2GOEiES3_PZHqzFT2NYgeJkp0Zg462d02io2VMLwe11Ei7x6SfMPnbTXjKxzjpr6D7Q3Z_84fLowvFfVXgYmJq5iv8EQCT9YZBj0nALp3YNsa6-4xc_NjK8tgfFTyohWec9D2x7tWQ-p3ACe5ZMCBBB48TWwPmdDo0gmccGXt7jZ3xiOiV1OTWYBo7JnxKjfrMzIC4BNUzAwnRMJ-p68H5UJj7_UrKCAvB8Vmn0_d8jnMMCIZ1m3qihD2wxAYKYIGVrbffU4Y0lgYgUBTLU5U9ZgJmVswqqbdNcGQrrgCzwGJcALS9qZPT5z-iV88-1EgemwBbA";
      return handler.next(request);
    }, onResponse: (response, handler) {
      return handler.next(response);
      // response data
      if (response.statusCode == 200) {
        print(response.data);
        return handler.next(response);
      }
    }, onError: (DioError error, errorInterceptorHandler) async {
      if (error.response?.statusCode == 404) {
        print('Page not Found!');
      } else {
        print(error.response?.statusCode);
        print(error.message);
      }
    }));
  }

  static Future<LiveSessionModel> getLiveSessionDetails() async {
    addInterceptors(_dio);
    try {
      final response = await _dio.get(url);
      print(response.data);
      // return Posts.listFromJSON(response.data);
      return LiveSessionModel.fromJson(response.data);
    } on DioError catch (e) {
      print(
          " ---- Failed to Load Posts : ${e.response?.statusCode.toString()} ----");
      print(e.message);

      throw Exception('Failed ');
    }
  }
}
