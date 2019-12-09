import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:popcorn_app_mobx/app/routes.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/styles/theme_style.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popcorn App - MobX',
      theme: AppTheme().themeData(),
      onGenerateRoute: AppRoutes().routeMain,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocaleDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
        const Locale('en'),
      ],
    );
  }
}
