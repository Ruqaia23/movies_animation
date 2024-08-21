import 'package:dio/dio.dart';
import 'package:movies_animation/constants/strings.dart';

class MoviesApis {
  late Dio dio;

  MoviesApis() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllMovies() async {
    try {
      Response response = await dio.get('model');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
