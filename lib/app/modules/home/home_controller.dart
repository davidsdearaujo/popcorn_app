import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final scrollController = ScrollController();
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
