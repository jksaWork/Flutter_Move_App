import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/data/Models/actor.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/views/Home/widgets/now_playing_items.dart';
import 'package:movies_app/views/Movies/widgets/movies_details.dart';
import 'package:transparent_image/transparent_image.dart';

class RelatedMovies extends StatelessWidget {
  bool isLoading;
  List<Movie> movies;
  String title;
  // bool? isShowAll;
  RelatedMovies(
      {Key? key,
      required this.isLoading,
      required this.movies,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 500,
            child: isLoading
                ? Container(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => Container(
                          height: 600,
                          child: Column(
                            children: [
                              RelateMovieItem(
                                movie: movies[index],
                              ),
                              SizedBox(height: 10),
                              RelateMovieItem(
                                movie: movies[movies.length ~/ 2 + index],
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 5),
                    itemCount: movies.length ~/ 2),
          ),
        ],
      ),
    );
  }
}

class RelateMovieItem extends StatelessWidget {
  Movie movie;
  String? type;
  RelateMovieItem({Key? key, required this.movie, this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => MovieDetailsScreen(movie: movie),
          preventDuplicates: false,
        );
      },
      child: Container(
        width: 350,
        height: 170,
        child: Row(
          children: <Widget>[
            Container(
              width: 120,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: '${movie.poster}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${movie.title}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.star, color: Colors.amber),
                      Text('${movie.vote}'),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${movie.description}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: -13,
                    children: [
                      ...movie.genres.take(3).map(
                        (genre) {
                          return Chip(
                            label: Text('${genre.name}',
                                style: TextStyle(fontSize: 11)),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 // end of RelatedMovieItem
 //end of widget
