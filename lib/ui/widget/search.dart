import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/data_/model/movies_model.dart';

class SearchMovies extends StatefulWidget {
  final List<model> allMovies;
  final MoviesCubit? moviesCubit;

  SearchMovies({Key? key, required this.allMovies, this.moviesCubit})
      : super(key: key);

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  late List<model> searchedForMovies;

  bool _isSearch = false;

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(4, 2, 24, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(4, 2, 24, 1),
        leading: _isSearch
            ? Container()
            : (BackButton(
                color: Color.fromRGBO(242, 97, 17, 1),
              )),
        title: TextField(
          controller: searchTextController,
          cursorColor: Color.fromRGBO(242, 97, 17, 1),
          decoration: InputDecoration(
            hintText: 'Find a Movie...',
            border: InputBorder.none,
            hintStyle:
                TextStyle(color: Color.fromRGBO(242, 97, 17, 1), fontSize: 18),
          ),
          style: TextStyle(color: Color.fromRGBO(242, 97, 17, 1), fontSize: 18),
          onChanged: (searchText) {
            widget.moviesCubit?.searchMovies(searchTextController.text);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Color.fromRGBO(242, 97, 17, 1),
            ),
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        //مهم للاستدعاء
        bloc: widget.moviesCubit,
        builder: (context, state) {
          if (state is MoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            final searchResults = state.movies;
            if (searchResults.isEmpty) {
              return Center(
                child: Text(
                  'No movies found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    searchResults[index].title ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            );
          } else if (state is MoviesError) {
            return Center(
              child: Text(
                'Error loading movies',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

//عشان يبحث بالحرف الاول الاسم الي يبدا بالحرف ينعرض
  // void addSearchedOfItemsToSearchedList(String searchText) {
  //   searchedForMovies = widget.allMovies
  //       .where((movie) => movie.title!.toLowerCase().startsWith(searchText))
  //       .toList();
  //   print(searchText);
  //   setState(() {});
  // }
}

class clearSearch {
  final TextEditingController searchTextController = TextEditingController();
  @override
  build(BuildContext context) {
    searchTextController.clear();
    context.read<MoviesCubit>().getAllMovies();
  }
}

class MoviesLoading {}

class MoviesError {}
