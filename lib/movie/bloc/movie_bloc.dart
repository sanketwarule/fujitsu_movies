import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fujitsu_movies/movie/model/movie.dart';
import 'package:fujitsu_movies/movie/repo/movie_repo.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepo movieRepository;
  int page = 1;
  bool isFetching = false;

  MovieBloc({
    @required this.movieRepository,
  }) : super(MovieInitialState());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMoviesEvent) {
      yield MovieLoadingState(message: 'Loading Movies');
      try{

      final movies = await movieRepository.fetchMovies(page: page);

          yield MovieLoadedState(
            movies: movies,
          );
          page++;
      } catch(e){
        yield MovieErrorState(message: e.toString());
      }
    }
  }
}
