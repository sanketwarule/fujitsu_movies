import 'dart:convert';
import 'package:fujitsu_movies/utils/api.dart';
import 'package:fujitsu_movies/movie/model/movie.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepo {
  Future<List<Movie>> fetchMovies({int page});
}

class MovieRepoImpl extends MovieRepo {
  @override
  Future<List<Movie>> fetchMovies({int page = 1}) async {

    print("page = " + page.toString());

    final response = await http.get(
        "${Api.baseUrl + Api.API_KEY}&language=en-US&page=$page",);
    print("status code :: " +
        response.statusCode.toString() +
        " response :: " +
        response.body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final results = List<Map<String, dynamic>>.from(data['results']);

      List<Movie> movies = results.map((movieData) => Movie.fromJson(movieData)).toList(growable: false);
      return movies;
    } else {
      throw Exception();
    }
  }

}