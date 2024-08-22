import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/constants/strings.dart';
import 'package:movies_animation/data_/apis/movies_apis.dart';
import 'package:movies_animation/data_/repository/Movies_repository.dart';
import 'package:movies_animation/ui/screens/Home.dart';
import 'package:movies_animation/ui/screens/details_screen.dart';

class AppRouter {
  late MoviesRepository moviesRepository;
  late MoviesCubit moviesCubit;

  AppRouter() {
    moviesRepository = MoviesRepository(MoviesApis());
    moviesCubit = MoviesCubit(moviesRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allMoviesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => MoviesCubit(moviesRepository),
            child: HomeScreen(),
          ),
        );

      case moviesDetailsScreen:
        return MaterialPageRoute(builder: (_) => MoviesDetailsScreen());
    }
  }
}
