import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:popcorn_app_mobx/app/modules/player/player_controller.dart';
import 'package:popcorn_app_mobx/app/modules/player/player_module.dart';

void main() {
  initModule(PlayerModule());
  PlayerController player;

  setUp(() {
    player = PlayerModule.to.bloc<PlayerController>();
  });

  group('PlayerController Test', () {
    test("First Test", () {
      expect(player, isInstanceOf<PlayerController>());
    });

    test("Set Value", () {
      expect(player.value, equals(0));
      player.increment();
      expect(player.value, equals(1));
    });
  });
}
