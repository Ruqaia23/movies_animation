import 'package:flutter/material.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/data_/model/movies_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/ui/widget/Movies_item.dart';
import 'package:movies_animation/ui/widget/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<model>? allMovies;
  late List<model> searchedForMovies;
  final _searchTextController = TextEditingController();
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getAllMovies();
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Color.fromRGBO(242, 97, 17, 1),
      ),
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(4, 2, 24, 1),
        child: Column(
          children: [
            buildMoviesList(),
          ],
        ),
      ),
    );
  }

  Widget buildBlocwidght() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          allMovies = state.movies;
          return buildLoadedList();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildMoviesList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allMovies!.length
          : searchedForMovies.length,
      itemBuilder: (ctx, i) {
        return MoviesItems(
            movie: _searchTextController.text.isEmpty
                ? allMovies![i]
                : searchedForMovies[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(4, 2, 24, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(4, 2, 24, 1),
        title: Text(
          'Movies',
          style: TextStyle(
            color: Color.fromRGBO(242, 97, 17, 1),
          ),
        ),
        actions: _buildAppBarActions(context),
      ),
      body: buildBlocwidght(),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Color.fromRGBO(242, 97, 17, 1),
        ),
        onPressed: () {
          _startSearch();
        },
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearch = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchMovies(
          allMovies: allMovies!,
          moviesCubit: context.read<MoviesCubit>(),
        ),
      ),
    );
  }

  void _stopSearching() {
    clearSearch();

    setState(() {
      _isSearch = true;
    });
  }

  // void clearSearch(BuildContext context) {
  //   _searchTextController.clear();
  //   context.read<MoviesCubit>().getAllMovies();
  // }
}
