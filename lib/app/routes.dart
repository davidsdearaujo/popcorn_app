import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/modules/home/home_module.dart';
import 'package:popcorn_app_mobx/app/modules/login/login_module.dart';

import 'modules/movie_details/movie_details_module.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext, RouteSettings)> routes = {
    '/': (_, settings) => LoginModule(),
    '/home': (_, settings) => HomeModule(),
    '/home/details': (_, settings) => MovieDetailsModule(settings.arguments),
  };

  Route<dynamic> routeMain(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      if (routes.containsKey(settings.name)) {
        return routes[settings.name](context, settings);
      } else {
        return Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
      }
    });
  }
}
