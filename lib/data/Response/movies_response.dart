import 'package:movies_app/data/Models/movie.dart';

class MovieResponse {
  List<Movie> movies = [];
  late int lastPage;

  MovieResponse.fromJson(Map<String, dynamic> json) {
    json['data']['movies']['data']
        .forEach((movie) => movies.add(Movie.fromJson(movie)));
    lastPage = json['data']['movies']['meta']['last_page'];
  }
}
