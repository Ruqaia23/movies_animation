part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<model> movies;
  MoviesLoaded(this.movies);
}

class SearchLoading extends MoviesState {}

class SearchLoaded extends MoviesState {
  final List<model> searchResults;

  SearchLoaded(this.searchResults);
}

class SearchError extends MoviesState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
