import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/views/Home/widgets/now_playing_items.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return GetBuilder<HomeController>(builder: (con) {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Now Playing ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'show all',
                    style:
                        TextStyle(fontSize: 15, color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              child: controller.is_playing_now_movies.value
                  ? Container(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          NowPalyingItem(
                            type: 'mine',
                            movie: controller.now_playing_movies[index],
                          ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: 10),
                      itemCount: controller.now_playing_movies.length),
            ),
          ],
        ),
      );
    });
  }
}
