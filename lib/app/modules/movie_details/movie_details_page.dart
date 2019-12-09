import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:loading_loading/loading_loading.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_model.dart';

import 'head/head_widget.dart';
import 'icons/icons_widget.dart';
import 'movie_details_controller.dart';
import 'movie_details_module.dart';
import 'tabs/tabs_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieModel model;
  const MovieDetailsPage(this.model, {Key key}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsController bloc = MovieDetailsModule.to.bloc();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    child: SliverList(
                      delegate: SliverChildListDelegate([
                        HeadWidget(widget.model),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Observer(
                            builder: (context) {
                              return Column(
                                children: <Widget>[
                                  if (widget.model.synopsis != null &&
                                      bloc.details == null)
                                    Text(
                                      widget.model.synopsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(color: Colors.white),
                                    ),
                                  if (bloc.details != null)
                                    Text(
                                      bloc.details.synopsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(color: Colors.white),
                                    ),
                                  IconsWidget(),
                                ],
                              );
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                ];
              },
              body: Container(
                height: MediaQuery.of(context).size.height,
                child: TabsWidget(),
              ),
            ),
          ),
        ),
        Observer(builder: (context) {
          return Visibility(
            visible: bloc.details == null,
            child: Material(
              color: Colors.black38,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text(AppLocale.of(context).getText("loading-label").toUpperCase())
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
