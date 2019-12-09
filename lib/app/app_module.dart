import 'package:popcorn_app_mobx/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/app_widget.dart';
import 'package:popcorn_app_mobx/app/shared/interceptors/custom_dio.dart';
import 'package:popcorn_app_mobx/app/shared/repositories/popcorn_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PopcornRepository(i.get())),
        Dependency((i) => CustomDio()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
