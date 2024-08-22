part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<model> movies;
  MoviesLoaded(this.movies);
}
