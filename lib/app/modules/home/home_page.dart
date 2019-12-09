import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/modules/home/home_controller.dart';
import 'package:popcorn_app_mobx/app/modules/home/home_module.dart';
import 'package:popcorn_app_mobx/app/shared/interceptors/custom_dio.dart';
import 'package:popcorn_app_mobx/app/shared/models/category_enum.dart';
import 'package:popcorn_app_mobx/app/shared/widgets/bottombar/bottombar_widget.dart';

import 'popular/popular_widget.dart';
import 'poster/poster_widget.dart';
import 'topbar/topbar_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController bloc = HomeModule.to.bloc();
  @override
  Widget build(BuildContext context) {
    return CustomDioLoading(
      padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: BottomBarWidget(),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              addAutomaticKeepAlives: true,
              controller: bloc.scrollController,
              padding: EdgeInsets.all(0),
              itemCount: CategoryEnum.values.length,
              itemBuilder: (context, index) {
                if (index == 0)
                  return PosterWidget();
                else
                  return PopularWidget(
                    title: categoryEnumTitle[CategoryEnum.values[index]],
                    category: CategoryEnum.values[index],
                  );
              },
            ),
            TopbarWidget(controller: bloc.scrollController),
          ],
        ),
      ),
    );
  }
}
