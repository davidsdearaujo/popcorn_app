import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/shared/locale/en-US_locale.dart';
import 'package:popcorn_app_mobx/app/shared/locale/pt-BR_locale.dart';

class AppLocale {
  final Locale locale;

  AppLocale(this.locale);

  static String text(BuildContext context, String request){
    return of(context).getText(request);
  }

  static AppLocale of(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'pt': ptBR(),
    'en': enUS(),
  };

  String getText(String request) {
    return _localizedValues[locale.languageCode][request];
  }
}

class AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocale> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocale.
    return SynchronousFuture<AppLocale>(AppLocale(locale));
  }

  @override
  bool shouldReload(AppLocaleDelegate old) => false;
}
