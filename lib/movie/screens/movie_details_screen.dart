import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:fujitsu_movies/movie/model/movie.dart';


class MovieDetailScreen extends StatelessWidget{

  final Movie movie;

  MovieDetailScreen({this.movie});

  @override
  Widget build(BuildContext context) {
    var image_url = 'https://image.tmdb.org/t/p/w500/';

    return new Scaffold(
      body: SafeArea(
        child: new Stack(
            fit: StackFit.expand,
            children: [
              new Image.network(image_url+movie.backdropPath,fit: BoxFit.cover,),
              new BackdropFilter(
                filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  color: Colors.black.withOpacity(0.5),
                )
                ,),
              new SingleChildScrollView(
                child: new Container(
                  margin: const EdgeInsets.all(20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(60.0),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            new Container(width: 300.0,height: 300.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new NetworkImage(image_url + movie.posterPath),fit: BoxFit.cover),

                              ),
                            ),

                            SizedBox(height: 10,),

                            Row(
                              children: <Widget>[
                                Expanded(child: Center(child: new Text(movie.title??"",style: new TextStyle(color: Colors.white,fontSize: 28.0,),))),],
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(child: Text(movie.overview ?? "",style: new TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
                        ],
                      ),
                      SizedBox(height:20),
                      Row(
                        children: <Widget>[
                          Expanded(child: new Text('Average Votes',style: new TextStyle(color: Colors.white,fontSize: 22.0,),)),
                          Text('${movie.voteAverage ?? ""}/10',style: new TextStyle(color: Colors.white,fontSize: 20.0,),)
                        ],
                      ),
                      SizedBox(height:20),
                      Row(
                        children: <Widget>[
                          Expanded(child: new Text('Release Date',style: new TextStyle(color: Colors.white,fontSize: 22.0,),)),
                          Text('${movie.releaseDate ?? ""}',style: new TextStyle(color: Colors.white,fontSize: 20.0,),)
                        ],
                      ),
                      SizedBox(height:20),
                      Row(
                        children: <Widget>[
                          Expanded(child: new Text('Language',style: new TextStyle(color: Colors.white,fontSize: 22.0,),)),
                          Text('${movie.originalLanguage ?? ""}',style: new TextStyle(color: Colors.white,fontSize: 20.0,),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}