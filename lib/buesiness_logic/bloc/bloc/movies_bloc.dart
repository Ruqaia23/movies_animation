import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/buesiness_logic/bloc/bloc/movies_event.dart';
import 'package:movies_animation/buesiness_logic/bloc/bloc/movies_state.dart';
import 'package:movies_animation/data_/model/movies_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final List<model> allMovies;

  SearchBloc(this.allMovies) : super(SearchInitial());

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchTextChanged) {
      yield SearchLoading();
      try {
        if (event.searchText.isEmpty) {
          yield SearchInitial();
        } else {
          final searchResults = allMovies
              .where((movie) => movie.title!
                  .toLowerCase()
                  .startsWith(event.searchText.toLowerCase()))
              .toList();
          yield SearchLoaded(searchResults);
        }
      } catch (e) {
        yield SearchError("Failed to search movies");
      }
    } else if (event is ClearSearch) {
      yield SearchInitial();
    }
  }
}
