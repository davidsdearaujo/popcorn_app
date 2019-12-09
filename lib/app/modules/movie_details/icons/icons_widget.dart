import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/shared/locale/locales.dart';
import 'package:popcorn_app_mobx/app/shared/widgets/icon/icon-widget.dart';

class IconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          IconWidget(Icons.add, AppLocale.of(context).getText("my-list-label"), selected: true),
          SizedBox(width: 25),
          IconWidget(Icons.thumb_up, AppLocale.of(context).getText("vote-label"), selected: true),
          SizedBox(width: 25),
          IconWidget(Icons.share, AppLocale.of(context).getText("share-label"), selected: true),
        ],
      ),
    );
  }
}
