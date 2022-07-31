import 'package:get/state_manager.dart';
import 'package:movies_app/core/Services/api.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/data/Response/movies_response.dart';

class MoviesController extends GetxController {
  List<Movie> now_playing_movies = [];
  bool is_playing_now_movies = false;
  void getNowPlayingMovies() async {
    is_playing_now_movies = true;
    var response = await Api.getMovies('now_playing');
    now_playing_movies.clear();
    MovieResponse movieResponse = MovieResponse.fromJson(response.data);
    now_playing_movies.addAll(movieResponse.movies);
    is_playing_now_movies = false;
    update();
  }

  @override
  void onInit() async {
    getNowPlayingMovies();
    // TODO: implement onInit
    super.onInit();
  }
}
