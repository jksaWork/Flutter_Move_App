import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/grener_controller.dart';
import 'package:movies_app/data/Models/genres.dart';
import 'package:movies_app/views/Movies/movies.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GenerController controller = Get.find();
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.genres.length,
        itemBuilder: (BuildContext context, int index) {
          Genre genre = controller.genres[index];
          return InkWell(
            onTap: () {
              Get.to(() => MoviesScreen(genre_id: genre.id));
            },
            child: Card(
              // shape: ShapeBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      genre.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text("${genre.moviesCount}"),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
