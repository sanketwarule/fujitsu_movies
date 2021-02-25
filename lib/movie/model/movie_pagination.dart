import 'movie.dart';

class MoviePaginationModel {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MoviePaginationModel({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults});

  MoviePaginationModel.fromJson(dynamic json) {
    page = json["page"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    if (results != null) {
      map["results"] = results.map((v) => v.toJson()).toList();
    }
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;
    return map;
  }

}