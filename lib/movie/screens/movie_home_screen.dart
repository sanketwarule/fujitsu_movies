import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fujitsu_movies/movie/bloc/movie_bloc.dart';
import 'package:fujitsu_movies/movie/bloc/movie_event.dart';
import 'package:fujitsu_movies/movie/repo/movie_repo.dart';
import 'package:fujitsu_movies/movie/screens/movies_list_screen.dart';

class MovieHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
        movieRepository: MovieRepoImpl(),
      )..add(FetchMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fujitsu Movies'),
        ),
        body: MovieListScreen(),
      ),
    );
  }
}


