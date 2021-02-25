import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fujitsu_movies/movie/bloc/movie_bloc.dart';
import 'package:fujitsu_movies/movie/repo/movie_repo.dart';
import 'package:fujitsu_movies/movie/screens/movie_home_screen.dart';

void main() {
  Bloc.observer = MovieBlocObserver();

  runApp(BlocProvider(
          create: (context) => MovieBloc(movieRepository: MovieRepoImpl()),
      child: FujitsuMoviesApp()));
}

class FujitsuMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fujitsu Movies',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MovieHomeScreen(),
    );
  }
}

class MovieBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
