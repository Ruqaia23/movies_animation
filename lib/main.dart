import 'package:flutter/material.dart';
import 'package:movies_animation/app_router.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/data_/repository/Movies_repository.dart';
import 'package:movies_animation/ui/widget/search.dart';

void main() {
  runApp(MoviesAnimation(
    appRouter: AppRouter(),
  ));
}

class MoviesAnimation extends StatelessWidget {
  final AppRouter appRouter;

  const MoviesAnimation({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      home: BlocProvider(
        create: (context) => MoviesCubit(MoviesRepository(context)),
        child: SearchMovies(
          allMovies: [],
        ),
      ),
    );
  }

  BlocProvider(
      {required MoviesCubit Function(dynamic context) create,
      required SearchMovies child}) {}
}
