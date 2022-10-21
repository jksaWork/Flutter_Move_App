import 'package:get/state_manager.dart';
import 'package:movies_app/core/Services/api.dart';
import 'package:movies_app/data/Models/actor.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/data/Response/actor_response.dart';
import 'package:movies_app/data/Response/movies_response.dart';
import 'package:movies_app/data/Response/related_movies.dart';

class MovieController extends GetxController {
  List<Movie> movies = [];
  List<Actor> actors = [];
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxInt lastPage = 1.obs;
  RxBool isLoadingPagination = false.obs;
  RxBool isActorsLoading = false.obs;
  RxBool isrelatedMoviesLoading = false.obs;
  List<Movie> relatedMovies = [];

  getMovies({String? type, int? genre_id, int? pageId}) async {
    if (pageId == 1) {
      isLoading.value = true;
      currentPage.value = 1;
      movies.clear();
    }

    var response = await Api.getMovies(
      page: pageId,
      type: type,
      genre_id: genre_id,
    );
    var movieResponse = MovieResponse.fromJson(response.data);

    movies.addAll(movieResponse.movies);
    lastPage.value = movieResponse.lastPage;

    isLoading.value = false;
    isLoadingPagination.value = false;
  }

  getActores({required int moiveId}) async {
    isActorsLoading.value = true;
    var response = await Api.getActors(movieId: moiveId);
    ActorResponse actorResponse = ActorResponse.fromJson(response.data);
    actors.clear();
    actors.addAll(actorResponse.actors);
    isActorsLoading.value = false;
  }

  getRelatedMovies({required int moiveId}) async {
    isrelatedMoviesLoading.value = true;
    var response = await Api.getRelatedMovies(movieId: moiveId);
    RelatedMoviesResponse relatedMoviesResponse =
        RelatedMoviesResponse.fromJson(response.data);
    relatedMovies.clear();
    relatedMovies.addAll(relatedMoviesResponse.movies);
    isrelatedMoviesLoading.value = false;
  }
}
