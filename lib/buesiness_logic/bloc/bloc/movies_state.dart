import 'package:movies_animation/data_/model/movies_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<model> searchResults;

  SearchLoaded(this.searchResults);
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
