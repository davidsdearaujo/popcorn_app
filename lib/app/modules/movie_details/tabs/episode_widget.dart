import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_details_model.dart';

class EpisodeWidget extends StatefulWidget {
  final Episode episode;

  EpisodeWidget(this.episode, {Key key}) : super(key: key);

  @override
  _EpisodeWidgetState createState() => _EpisodeWidgetState();
}

class _EpisodeWidgetState extends State<EpisodeWidget> {
  bool expanded = false;

  String locale(String request) => AppLocale.text(context, request);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            leading: Text(
              widget.episode?.episode?.toString() ?? "",
              style: TextStyle(color: Colors.white),
            ),
            title: Text(widget.episode.title),
            trailing: IconButton(
              icon: Icon(Icons.play_circle_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Theme.of(context).backgroundColor,
                      title: Text(AppLocale.text(
                        context,
                        'select-resolution-label',
                      )),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.episode.torrents.entries.map(
                          (item) {
                            return ListTile(
                              title: Text(
                                item.key,
                                style: TextStyle().copyWith(
                                  color:
                                      Theme.of(context).primaryIconTheme.color,
                                ),
                              ),
                              onTap: () {
                                // Navigator.pushNamed(context, "/home/details/player", arguments: item.value.url);
                              },
                            );
                          },
                        ).toList(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: expanded ? null : 0,
            child: Text(
              widget.episode.overview ??
                  AppLocale.text(context, 'no-description-label'),
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
