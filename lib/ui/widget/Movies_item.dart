import 'package:flutter/material.dart';
import 'package:movies_animation/data_/model/movies_model.dart';

class MoviesItems extends StatelessWidget {
  final model movie;
  const MoviesItems({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: movie.posterURL!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading.gif",
                  image: movie.posterURL!,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/movies.jpg'),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Color.fromARGB(4, 2, 24, 54),
          alignment: Alignment.bottomCenter,
          child: Text(
            '${movie.title}',
            style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
