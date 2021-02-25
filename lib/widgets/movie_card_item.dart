import 'package:flutter/material.dart';
import 'package:fujitsu_movies/movie/model/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({Key key, this.movie, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? (){},
      child: Image.network(
        movie.imageUri,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, e, s) {
          return Center(
            child: Icon(Icons.error),
          );
        },
      ),
    );
  }
}