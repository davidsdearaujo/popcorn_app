import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/movie_details_module.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_details_model.dart';
import 'package:popcorn_app_mobx/app/shared/models/temporada_model.dart';
import 'package:widgets/src/dropdown/dropdown_widget.dart';

import '../movie_details_controller.dart';
import 'episode_widget.dart';

class TabsWidget extends StatelessWidget {
  final MovieDetailsController detailsBloc = MovieDetailsModule.to.bloc();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        List<Widget> tabs = [
          if (detailsBloc.details?.numSeasons != null)
            Tab(text: AppLocale.text(context, "episodes-label").toUpperCase()),
          Tab(text: AppLocale.text(context, "trailers-and-more-label").toUpperCase()),
        ];

        return DefaultTabController(
          length: tabs.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              TabBar(
                tabs: tabs,
                indicatorColor: Colors.red,
                isScrollable: true,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    if (detailsBloc.details?.numSeasons != null)
                      SeasonsTab(details: detailsBloc.details),
                    ListView(
                      children: <Widget>[
                        EpisodeWidget(
                          Episode(
                            title: AppLocale.text(context, "trailer-label"),
                            overview: "",
                            watched: Watched(watched: false),
                            torrents: {
                              "youtube": Torrent(
                                url: detailsBloc.model?.trailer,
                                provider: Provider.YOUTUBE,
                                peers: 0,
                                seeds: 0,
                              )
                            },
                          ),
                          key: UniqueKey(),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SeasonsTab extends StatefulWidget {
  const SeasonsTab({
    Key key,
    @required this.details,
  }) : super(key: key);

  final MovieDetailsModel details;

  @override
  _SeasonsTabState createState() => _SeasonsTabState();
}

class _SeasonsTabState extends State<SeasonsTab>
    with AutomaticKeepAliveClientMixin {
  final MovieDetailsController detailsBloc = MovieDetailsModule.to.bloc();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) {
        List<Episode> episodes =
            detailsBloc.episodes ?? widget.details.episodes;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).accentColor,
              ),
              child: Container(
                margin: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                child: DropDownWidget<SeasonModel>(
                  label: AppLocale.text(context, "season-label"),
                  options: detailsBloc.seasons,
                  onChanged: detailsBloc.setSeason,
                  value:
                      detailsBloc.selectedSeason ?? detailsBloc.seasons.first,
                  // color: Colors.white,
                  textColor: Colors.black,
                  // insideTitle: false,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: episodes.length,
                itemBuilder: (context, index) => EpisodeWidget(episodes[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
