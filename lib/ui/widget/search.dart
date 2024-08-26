import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/data_/model/movies_model.dart';

class SearchMovies extends StatelessWidget {
  final List<model> allMovies;
  final TextEditingController _searchTextController = TextEditingController();

  SearchMovies({Key? key, required this.allMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(4, 2, 24, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(4, 2, 24, 1),
        title: TextField(
          controller: _searchTextController,
          cursorColor: Color.fromRGBO(242, 97, 17, 1),
          decoration: InputDecoration(
            hintText: 'Find a Movie...',
            border: InputBorder.none,
            hintStyle:
                TextStyle(color: Color.fromRGBO(242, 97, 17, 1), fontSize: 18),
          ),
          style: TextStyle(color: Color.fromRGBO(242, 97, 17, 1), fontSize: 18),
          onChanged: (searchText) {
            context.read<MoviesCubit>().searchMovies(searchText);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Color.fromRGBO(242, 97, 17, 1),
            ),
            onPressed: () {
              _clearSearch(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
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

  void _clearSearch(BuildContext context) {
    _searchTextController.clear();
    context.read<MoviesCubit>().getAllMovies();
  }
}

class MoviesError {}

class MoviesLoading {}
