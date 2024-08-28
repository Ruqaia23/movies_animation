import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_animation/data_/model/movies_model.dart';
import 'package:movies_animation/data_/repository/Movies_repository.dart';
import 'package:movies_animation/ui/screens/Home.dart';
import 'package:movies_animation/ui/widget/search.dart';

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

  void searchMovies(String query) {
    if (query.isEmpty) {
      emit(MoviesLoaded(movies)); // إذا كان النص فارغًا، عرض جميع الأفلام
    } else {
      try {
        final searchResults = movies
            .where((movie) =>
                movie.title!.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
        emit(MoviesLoaded(searchResults));
      } catch (e) {
        //emit(MoviesError("Failed to search movies"));
      }
    }
  }
}
//emit(
//          MoviesLoading()); // استخدم MoviesLoading للإشارة إلى أن البيانات قيد التحميل
//     try {
//       final movies = await moviesRepository.searchMovies(query);
//       emit(MoviesLoaded(movies));
//     } catch (e) {
//       emit(MoviesError(
//           "Failed to search movies")); // لا حاجة لاستخدام as MoviesState هنا
//     }
//   }
//}

// Stream<SearchState> mapEventToState(SearchEvent event) async* {
//     if (event is SearchTextChanged) {
//       yield SearchLoading();
//       try {
//         if (event.searchText.isEmpty) {
//           yield SearchInitial();
//         } else {
//           final searchResults = allMovies
//               .where((movie) => movie.title!
//                   .toLowerCase()
//                   .startsWith(event.searchText.toLowerCase()))
//               .toList();
//           yield SearchLoaded(searchResults);
//         }
//       } catch (e) {
//         yield SearchError("Failed to search movies");
//       }
//     } else if (event is ClearSearch) {
//       yield SearchInitial();
//     }
//}
