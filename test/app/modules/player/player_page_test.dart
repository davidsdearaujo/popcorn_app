import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:popcorn_app_mobx/app/modules/player/player_page.dart';

main() {
  testWidgets('PlayerPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PlayerPage(title: 'Player')));
    final titleFinder = find.text('Player');
    expect(titleFinder, findsOneWidget);
  });
}
