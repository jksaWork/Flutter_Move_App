import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/views/Home/widgets/now_playing.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesController controller = Get.put(MoviesController());
    return Center(
        child: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView(
                  children: [
                    NowPlayingMovies(),
                    // Text('hello'),
                  ],
                ))));
  }
}
