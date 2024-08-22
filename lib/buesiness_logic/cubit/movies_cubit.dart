import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_animation/data_/model/movies_model.dart';
import 'package:movies_animation/data_/repository/Movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;
  List<model> movies = [];
  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<model> getAllMovies() {
    moviesRepository.getAllMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });
    return movies;
  }
}
