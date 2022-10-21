import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movie_controller.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/views/Movies/widgets/actors/actors_section.dart';
import 'package:movies_app/views/Movies/widgets/related_movies/related_movies.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieController controller = Get.find<MovieController>();

  @override
  void initState() {
    controller.getActores(moiveId: widget.movie.id);
    controller.getRelatedMovies(moiveId: widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                expandedHeight: 250,
                backgroundColor: AppColor.primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                    background: MovieBackground(movie: widget.movie)),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  MovieDescriptions(movie: widget.movie),
                  ActorSection(
                      isLoading: controller.isActorsLoading.value,
                      actors: controller.actors,
                      title: 'Actors'),
                  SizedBox(height: 20),
                  RelatedMovies(
                    isLoading: controller.isrelatedMoviesLoading.value,
                    movies: controller.relatedMovies,
                    title: 'relatedMovie',
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}

MovieBackground({required Movie movie}) {
  return Stack(
    children: [
      Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(movie.poster), fit: BoxFit.cover),
          )),
      Container(
          decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.3)),
        BoxShadow(color: Colors.black.withOpacity(.5)),
      ])),
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
                backgroundColor: AppColor.primaryColor,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('8.9', style: TextStyle(color: Colors.white)),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                )),
            Text(
              'ls investigation into her fate uncovers clues and revelations that lead not only to the truth',
              maxLines: 2,
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            Wrap(
              spacing: 2,
              runSpacing: -4,
              children: [
                ...movie.genres.map(
                  (gen) => Chip(label: Text(gen.name)),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}

MovieDescriptions({required Movie movie}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          movie.description,
        ),
        SizedBox(height: 10),
        GetTableCell('relase Date:', movie.releaseDate),
        SizedBox(height: 5),
        GetTableCell('vote cuont:', movie.voteCount),
      ],
    ),
  );
}

Container GetTableCell(String key, String value) {
  return Container(
    child: Row(children: [
      Container(
        width: 120,
        child: Text(
          key,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Text(value)
    ]),
  );
}
