import 'package:popcorn_app_mobx/app/modules/home/topbar/topbar_controller.dart';
import 'package:popcorn_app_mobx/app/modules/home/poster/poster_controller.dart';
import 'package:popcorn_app_mobx/app/modules/home/popular/popular_controller.dart';
import 'package:popcorn_app_mobx/app/modules/home/home_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/modules/home/home_page.dart';

import '../../app_module.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TopbarController()),
        Bloc((i) => PosterController()),
        Bloc((i) => PopularController(AppModule.to.get()), singleton: false),
        Bloc((i) => HomeController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
