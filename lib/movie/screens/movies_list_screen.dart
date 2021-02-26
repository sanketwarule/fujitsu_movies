import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fujitsu_movies/movie/bloc/movie_bloc.dart';
import 'package:fujitsu_movies/movie/bloc/movie_event.dart';
import 'package:fujitsu_movies/movie/bloc/movie_state.dart';
import 'package:fujitsu_movies/movie/model/movie.dart';
import 'package:fujitsu_movies/movie/screens/movie_details_screen.dart';
import 'package:fujitsu_movies/utils/utils.dart';
import 'package:fujitsu_movies/widgets/movie_card_item.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {
          if (state is MovieLoadingState) {
            Utils().showSnackBar(context, state.message);
          } else if (state is MovieLoadedState && state.movies.isEmpty) {
            Utils().showSnackBar(context, 'No More Movies');
          } else if (state is MovieErrorState) {
            Utils().showSnackBar(context, state.message);
            BlocProvider.of<MovieBloc>(context).isFetching = false;
          }
          return;
        },
        builder: (context, movieState) {
          if (movieState is MovieInitialState ||
              movieState is MovieLoadingState && _movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (movieState is MovieLoadedState) {
            _movies.addAll(movieState.movies);
            BlocProvider.of<MovieBloc>(context).isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (movieState is MovieErrorState && _movies.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<MovieBloc>(context)
                      ..isFetching = true
                      ..add(FetchMoviesEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(movieState.message, textAlign: TextAlign.center),
              ],
            );
          }
          return _body(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  Widget _body(BuildContext context ) {
    return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 300,
    crossAxisSpacing: 1.0,
    mainAxisSpacing: 1.0,
    childAspectRatio: 0.7,
    ),
        itemCount: _movies.length,
      controller: _scrollController
        ..addListener(() {
          if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
              !BlocProvider.of<MovieBloc>(context).isFetching) {
            BlocProvider.of<MovieBloc>(context)
              ..isFetching = true
              ..add(FetchMoviesEvent());
          }
        }),
        itemBuilder: (context, index) => MovieCard(movie:_movies[index], onTap: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(movie:_movies[index])));
          print("onTap : " + _movies[index].title);
        },),
    );

  }
}
