import 'package:flutter/material.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesItem extends StatelessWidget {
  Movie movie;
  MoviesItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 200,
            child: Stack(
              children: [
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: movie.poster,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        '${movie.title}',
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5),
                        Text('8.8')
                      ],
                    )
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    movie.description,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
