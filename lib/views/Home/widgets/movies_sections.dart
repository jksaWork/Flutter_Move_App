import 'package:flutter/material.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/views/Home/widgets/now_playing_items.dart';

class MoviesSection extends StatelessWidget {
  bool isLoading;
  List<Movie> movies;
  String title;
  MoviesSection(
      {Key? key,
      required this.isLoading,
      required this.movies,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'show all',
                  style: TextStyle(fontSize: 15, color: AppColor.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .4 - 50,
            child: isLoading
                ? Container(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        NowPalyingItem(
                          movie: movies[index],
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 5),
                    itemCount: movies.length),
          ),
        ],
      ),
    );
  }
}
