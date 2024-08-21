import 'package:flutter/material.dart';
import 'package:movies_animation/constants/strings.dart';
import 'package:movies_animation/ui/screens/Home.dart';
import 'package:movies_animation/ui/screens/details_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allMoviesRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case moviesDetailsScreen:
        return MaterialPageRoute(builder: (_) => MoviesDetailsScreen());
    }
  }
}
