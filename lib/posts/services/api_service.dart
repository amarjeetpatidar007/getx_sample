import 'package:dio/dio.dart';
import '../models/post_model.dart';

class NetworkService {
  static final Dio _dio = Dio();
  static String url = "https://jsonplaceholder.typicode.com/posts/";

  static Future addInterceptors(Dio dio) async {
    return dio.interceptors.add(InterceptorsWrapper(
        //       onRequest: (request, handler) {
        // before request is sent
        // },
        onResponse: (response, handler) {
      // response data
      if (response.statusCode == 200) {
        // print(response.data);
        return handler.next(response);
      }
    }, onError: (DioError error, errorInterceptorHandler) async {
      if (error.response?.statusCode == 404) {
        print('Page not Found!');
      } else {
        print(error.response?.statusCode);
      }
    }));
  }

  // Get Posts List
  static Future<List<Posts>> getPosts() async {
    addInterceptors(_dio);
    try {
      final response = await _dio.get(url);
      return Posts.listFromJSON(response.data);
      // return list;
    } on DioError catch (e) {
      print(
          " ---- Failed to Load Posts : ${e.response?.statusCode.toString()} ----");
      throw Exception('Failed to load posts');
    }
  }

  static Future<Posts> createPost(int userId, String title, String body) async {
    dynamic data = {"title": title, "body": body, "userId": 1};
    addInterceptors(_dio);
    try {
      final response = await _dio.post(url,
          options: Options(headers: {
            'Content-type': 'application/json; charset=UTF-8',
          }),
          data: data);
      print('Post Added');
      return Posts.fromJson(response.data);
    } on DioError catch (e) {
      print(
          '${e.response?.headers} : ${e.response?.data.toString()} ${e.response?.statusCode}');
      throw Exception('Failed to Create posts');
    }
  }

  static Future<Posts> updatePost(
      int id, int userId, String title, String body) async {
    dynamic data = {"id": id, "title": title, "body": body, "userId": userId};
    addInterceptors(_dio);

    try {
      final response = await _dio.put("$url$id",
          options: Options(headers: {
            'Content-type': 'application/json; charset=UTF-8',
          }),
          data: data);
      print('Post Edited');
      return Posts.fromJson(response.data);
    } on DioError catch (e) {
      print(
          '${e.response?.headers} : ${e.response?.data.toString()} ${e.response?.statusCode}');
      throw Exception('Failed to Update post');
    }
  }

  static Future<void> deleteUser({required int id}) async {
    try {
      await _dio.delete('$url$id');
      print('User deleted!');
    } catch (e) {
      throw Exception('Failed to Delete post');
    }
  }
}
