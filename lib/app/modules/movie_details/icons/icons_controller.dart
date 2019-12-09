import 'package:mobx/mobx.dart';

part 'icons_controller.g.dart';

class IconsController = _IconsBase with _$IconsController;

abstract class _IconsBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
