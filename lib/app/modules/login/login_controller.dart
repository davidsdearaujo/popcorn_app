import 'package:mobx/mobx.dart';
import 'package:popcorn_app_mobx/app/shared/interceptors/custom_dio.dart';
import 'package:rxdart/rxdart.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final dio = CustomDio();

  final dados$ = BehaviorSubject<dynamic>();

  void getData() {
    dados$.addStream(dio.get("http://worldclockapi.com/api/json/est/now"));
  }

  @override
  void dispose() {
    dio.dispose();
    dados$.close();
    super.dispose();
  }
}
