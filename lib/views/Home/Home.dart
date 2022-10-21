import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/views/Home/widgets/movies_sections.dart';
import 'package:movies_app/views/Home/widgets/now_playing.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Obx(() => Center(
        child: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    NowPlayingMovies(),
                    SizedBox(height: 20),
                    MoviesSection(
                      movies: controller.PupularMovies,
                      isLoading: controller.IsloadingPupularMovies.value,
                      title: 'Popular',
                    ),
                    MoviesSection(
                      movies: controller.UpCommingMovies,
                      isLoading: controller.IsloadingUpCommingMovies.value,
                      title: 'Up Comming ',
                    ),
                  ],
                )))));
    // Text('hello'),
  }
}
