import 'package:popcorn_app_mobx/app/app_module.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/tabs/tabs_controller.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/icons/icons_controller.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/head/head_controller.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/movie_details_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/modules/movie_details/movie_details_page.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_model.dart';

class MovieDetailsModule extends ModuleWidget {
  final MovieModel model;

  MovieDetailsModule(this.model);
  
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TabsController()),
        Bloc((i) => IconsController()),
        Bloc((i) => HeadController()),
        Bloc((i) => MovieDetailsController(AppModule.to.get(), model)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => MovieDetailsPage(model);

  static Inject get to => Inject<MovieDetailsModule>.of();
}
