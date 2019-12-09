import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/movie_details_module.dart';
import 'package:popcorn_app_mobx/app/shared/models/category_enum.dart';
import 'package:popcorn_app_mobx/app/shared/widgets/horizontal_list/horizontal_list_widget.dart';
import 'package:popcorn_app_mobx/app/shared/widgets/movie/movie_widget.dart';

import '../home_module.dart';
import 'popular_controller.dart';

class PopularWidget extends StatefulWidget {
  final String title;
  final CategoryEnum category;

  const PopularWidget({
    Key key,
    @required this.title,
    @required this.category,
  }) : super(key: key);

  @override
  _PopularWidgetState createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget>
    with AutomaticKeepAliveClientMixin {
  final PopularController bloc = HomeModule.to.bloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    bloc.find(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (context) {
        if (bloc.moviesList == null)
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 2.3,
            ),
            height: 50,
            child: CircularProgressIndicator(strokeWidth: 5),
          );
        else
          return HorizontalListWidget(
            label: widget.title,
            itemsCount: bloc.moviesList.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/home/details",
                    arguments: bloc.moviesList[index],
                  );
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MovieDetailsModule(
                  //     bloc.moviesList[index],
                  //   ),
                  // ));
                },
                child: MovieWidget(model: bloc.moviesList[index]),
              );
            },
          );
      },
    );
  }
}
