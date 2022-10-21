import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movie_controller.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/views/Movies/widgets/movies_details.dart';
// import 'package:movies_app/models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesScreen extends StatefulWidget {
  final String? type;
  final int? genre_id;

  MoviesScreen({Key? key, this.type, this.genre_id});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final movieController = Get.put(MovieController());
  final scrollController = ScrollController();

  @override
  void initState() {
    movieController.getMovies(
      genre_id: widget.genre_id,
      type: widget.type,
    );

    scrollController.addListener(() {
      var sControllerOffset = scrollController.offset;
      var sControllerMax = scrollController.position.maxScrollExtent - 100;
      var isLoadingPagination = movieController.isLoadingPagination.value;
      var hasMorePages =
          movieController.currentPage.value < movieController.lastPage.value;

      if (sControllerOffset > sControllerMax &&
          isLoadingPagination == false &&
          hasMorePages) {
        movieController.isLoadingPagination.value = true;
        movieController.currentPage.value++;
        print('get Moves');
        movieController.getMovies(
          pageId: movieController.currentPage.value,
          type: widget.type,
          genre_id: widget.genre_id,
        );
      }
    });
    super.initState();
  } //end of init state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Obx(() {
        return movieController.isLoading.value == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(10),
                child: RefreshIndicator(
                  onRefresh: () {
                    return movieController.getMovies(
                      pageId: 1,
                      genre_id: widget.genre_id,
                      type: widget.type,
                    );
                  },
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: movieController.movies.length,
                          itemBuilder: (context, index) {
                            return buildMovieItem(
                                movieController.movies[index]);
                          },
                          separatorBuilder: (content, index) {
                            return SizedBox(height: 15);
                          },
                        ),
                        Visibility(
                          visible: movieController.isLoadingPagination.value,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 40,
                            height: 40,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  } //end of build

  Widget buildMovieItem(Movie movie) {
    return InkWell(
      onTap: () {
        Get.to(MovieDetailsScreen(movie: movie));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 130,
            height: 200,
            child: Stack(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '${movie.poster}',
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //movie name
                    Expanded(
                      child: Text(
                        '${movie.title}',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    //icon and rating
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 5),
                        Text('${movie.vote}', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '${movie.description}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  } // end of movieItem
} //end of class
