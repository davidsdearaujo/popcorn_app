import 'package:mobx/mobx.dart';

part 'head_controller.g.dart';

class HeadController = _HeadBase with _$HeadController;

abstract class _HeadBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
