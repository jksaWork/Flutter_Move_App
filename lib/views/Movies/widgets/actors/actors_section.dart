import 'package:flutter/material.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/data/Models/actor.dart';
import 'package:movies_app/data/Models/movie.dart';
import 'package:movies_app/views/Home/widgets/now_playing_items.dart';
import 'package:transparent_image/transparent_image.dart';

class ActorSection extends StatelessWidget {
  bool isLoading;
  List<Actor> actors;
  String title;
  // bool? isShowAll;
  ActorSection(
      {Key? key,
      required this.isLoading,
      required this.actors,
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
                    itemBuilder: (BuildContext context, int index) => ActorItem(
                          actor: actors[index],
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 5),
                    itemCount: actors.length),
          ),
        ],
      ),
    );
  }
}

class ActorItem extends StatelessWidget {
  Actor actor;
  String? type;
  ActorItem({Key? key, required this.actor, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * .4),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: type == null
                  ? (MediaQuery.of(context).size.height * .4) - 100
                  : (MediaQuery.of(context).size.height * .4) - 53,
              child: Container(
                child: Stack(children: [
                  Container(child: Center(child: CircularProgressIndicator())),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: actor.image,
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
                        actor.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
