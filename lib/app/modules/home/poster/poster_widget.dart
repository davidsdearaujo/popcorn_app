import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/shared/models/category_enum.dart';
import 'package:popcorn_app_mobx/app/shared/widgets/icon/icon-widget.dart';

import '../popular/popular_widget.dart';

class PosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height + 50,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: double.infinity,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.withOpacity(0.5),
                  Colors.transparent,
                  Theme.of(context).backgroundColor,
                ],
                stops: [0.1, 0.6, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Image.network(
              "https://http2.mlstatic.com/poster-cartaz-stranger-things-mundo-invertido-arte-oferta-D_NQ_NP_668431-MLB26197936347_102017-F.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 250,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconWidget(Icons.add, "Minha lista"),
                RaisedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.play_arrow, size: 27),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Assistir",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                IconWidget(Icons.info_outline, "Saiba mais"),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PopularWidget(
              title: "Filmes",
              category: CategoryEnum.movies,
            ),
          )
        ],
      ),
    );
  }
}
