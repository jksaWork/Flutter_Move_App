import 'package:movies_app/data/Models/movie.dart';

class RelatedMoviesResponse {
  List<Movie> movies = [];
  late int lastPage;

  RelatedMoviesResponse.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((movie) => movies.add(Movie.fromJson(movie)));
  }
}
