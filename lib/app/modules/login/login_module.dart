import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/app_module.dart';
import 'package:popcorn_app_mobx/app/modules/login/login_controller.dart';
import 'package:popcorn_app_mobx/app/modules/login/login_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
