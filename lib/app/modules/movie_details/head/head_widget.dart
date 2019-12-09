import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_model.dart';

class HeadWidget extends StatelessWidget {
  final MovieModel model;

  const HeadWidget(this.model, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(model.images.fanart ??
                  "http://loden.org/wp-content/uploads/2016/09/No_Image_Available.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '/home/details/player',
              //   arguments: model,
              // );
            },
            child: Container(
              height: 290,
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.5],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "${model.rating.percentage}% ${AppLocale.of(context).getText("relevant-label")}",
                        style: Theme.of(context).textTheme.body2.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Text(
                        model.year,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      if (model.numSeasons != null)
                        Text(
                          "${model.numSeasons} ${AppLocale.of(context).getText("seasons-label")}",
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: Colors.white),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
