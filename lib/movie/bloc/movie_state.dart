import 'package:equatable/equatable.dart';
import 'package:fujitsu_movies/movie/model/movie.dart';

abstract class MovieState extends Equatable {}

class MovieInitialState extends MovieState {

  @override
  List<Object> get props => [];
}

class MovieErrorState extends MovieState {

  final String message;

  MovieErrorState({this.message});

  @override
  List<Object> get props => [message];
}

class MovieLoadingState extends MovieState {

  final String message;

  MovieLoadingState({this.message});

  @override
  List<Object> get props => [];

}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  MovieLoadedState({
    this.movies,
  });

  @override
  String toString() =>
      'MovieLoadedState { movies: ${movies.length} }';

  @override
  List<Object> get props => [movies];


}