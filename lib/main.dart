import 'package:flutter/material.dart';
import 'package:movies_animation/app_router.dart';

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
    );
  }
}
