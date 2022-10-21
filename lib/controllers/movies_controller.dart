import 'package:get/state_manager.dart';
import 'package:movies_app/core/Services/api.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/data/Response/movies_response.dart';

class HomeController extends GetxController {
  List<Movie> now_playing_movies = [];
  RxBool is_playing_now_movies = false.obs;

  List<Movie> PupularMovies = [];
  RxBool IsloadingPupularMovies = false.obs;

  List<Movie> UpCommingMovies = [];
  RxBool IsloadingUpCommingMovies = false.obs;

  void getNowPlayingMovies() async {
    is_playing_now_movies.value = true;
    var response = await Api.getMovies(type: 'now_playing');
    now_playing_movies.clear();
    MovieResponse movieResponse = MovieResponse.fromJson(response.data);
    now_playing_movies.addAll(movieResponse.movies);
    is_playing_now_movies.value = false;
    update();
  }

  void getUpCommingMovies() async {
    IsloadingUpCommingMovies.value = true;
    var response = await Api.getMovies(type: 'upcoming');
    UpCommingMovies.clear();
    MovieResponse movieResponse = MovieResponse.fromJson(response.data);
    UpCommingMovies.addAll(movieResponse.movies);
    IsloadingUpCommingMovies.value = false;
  }

  void getPupularMovies() async {
    IsloadingPupularMovies.value = true;
    var response = await Api.getMovies(type: 'popular');
    PupularMovies.clear();
    MovieResponse movieResponse = MovieResponse.fromJson(response.data);
    PupularMovies.addAll(movieResponse.movies);
    IsloadingPupularMovies.value = false;
  }

  @override
  void onInit() async {
    getNowPlayingMovies();
    getPupularMovies();
    getUpCommingMovies();
    // TODO: implement onInit
    super.onInit();
  }
}
