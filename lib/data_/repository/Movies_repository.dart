import 'package:movies_animation/data_/apis/movies_apis.dart';
import 'package:movies_animation/data_/model/movies_model.dart';

class MoviesRepository {
  final MoviesApis moviesApis;

  MoviesRepository(this.moviesApis);

  Future<List<model>> getAllMovies() async {
    final movies = await moviesApis.getAllMovies();
    return movies.map((movies) => model.fromJson(movies)).toList();
  }

  Future<List<model>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
