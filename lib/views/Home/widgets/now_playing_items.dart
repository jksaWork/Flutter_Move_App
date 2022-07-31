import 'package:flutter/material.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class NowPalyingItem extends StatelessWidget {
  Movie movie;
  NowPalyingItem({Key? key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height * .4) - 53,
              child: Container(
                child: Stack(children: [
                  Container(child: Center(child: CircularProgressIndicator())),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: movie.banner != null
                        ? movie.poster
                        : 'https://image.tmdb.org/t/p/w500/tH1afdfqqrYTP3l2oqsHEsNN5ul.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5),
                        Text(movie.voteCount),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
