import 'package:flutter/material.dart';
import 'package:popcorn_app_mobx/app/modules/login/login_controller.dart';
import 'package:popcorn_app_mobx/app/modules/login/login_module.dart';
import 'package:popcorn_app_mobx/app/shared/interceptors/custom_dio.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController bloc = LoginModule.to.bloc();

  @override
  Widget build(BuildContext context) {
    return CustomDioLoading(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              bloc.getData();
            });
          },
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.dados$,
            builder: (context, snapshot) {
              return Text((snapshot.data == null)
                  ? "null"
                  : snapshot.data?.data["currentFileTime"]?.toString());
            },
          ),
        ),
      ),
    );
  }
}
