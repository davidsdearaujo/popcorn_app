import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/cache_interceptor.dart';
import '../interceptors/printlog_interceptor.dart';

class CustomDio implements Disposable {
  final Dio instance = Dio();
  CustomDio({
    bool isApi = true,
    bool isCached = true,
    List<Interceptor> customInterceptors,
    String baseUrl,
  }) {
    if (isApi) {
      instance.options.baseUrl = baseUrl;
      _initInterceptors();
    }
    instance.interceptors.add(PrintLogInterceptor());

    if (customInterceptors != null)
      instance.interceptors.addAll(customInterceptors);

    if (isCached) {
      instance.interceptors.add(CacheInterceptor());
    }
  }

  _initInterceptors() {
    instance.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options; //continue
    }, onResponse: (Response response) {
      return response; // continue
    }, onError: (DioError e) {
      return e; //continue
    }));
  }

  Stream<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async* {
    try {
      String key = "[GET]$path";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(key)) {
        var data = jsonDecode(prefs.getString(key));
        yield await instance.resolve(Response(data: data));
        await CustomDioLoading.setLoading(key);
      }
      var response = await instance.get<T>(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
      );
      yield response;
      if (response.statusCode == 200) {
        await CustomDioLoading.updateDate(key);
        prefs.setString(key, jsonEncode(response.data));
      }
    } catch (err) {
      yield* Stream.error(err);
    }
  }

  Stream<Response> post(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async* {
    try {
      String key = "[POST]$path";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(key)) {
        var data = jsonDecode(prefs.getString(key));
        yield await Dio().resolve(Response(data: data));
        await CustomDioLoading.setLoading(key);
      }

      var response = await instance.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      yield response;
      if (response.statusCode == 200) {
        await CustomDioLoading.updateDate(key);
        prefs.setString(key, jsonEncode(response.data));
      }
    } catch (err) {
      yield* Stream.error(err);
    }
  }

  @override
  void dispose() {
    instance.close(force: true);
  }
}

class CustomDioLoading extends StatefulWidget {
  static Future<void> setLoading(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("[DATE]$key")) {
      final milliSeconds = prefs.getInt("[DATE]$key");

      final model = CustomDioLoadingModel(
        state: CustomDioLoadingState.old,
        dateTime: DateTime.fromMillisecondsSinceEpoch(milliSeconds),
      );

      state$.add(model);
    }
  }

  static Future<void> updateDate(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final date = DateTime.now();
    await prefs.setInt("[DATE]$key", date.millisecondsSinceEpoch);

    final model = CustomDioLoadingModel(
      state: CustomDioLoadingState.updated,
      dateTime:
          DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch),
    );

    state$.add(model);
  }

  static final state$ = BehaviorSubject<CustomDioLoadingModel>();

  final Widget child;
  final Alignment alignment;
  final EdgeInsets padding;

  const CustomDioLoading({
    Key key,
    @required this.child,
    this.alignment = Alignment.bottomCenter,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  @override
  _CustomDioLoadingState createState() => _CustomDioLoadingState();
}

class _CustomDioLoadingState extends State<CustomDioLoading> {
  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year.toString().padLeft(4, '0')} - "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}:"
        "${date.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Align(
          alignment: widget.alignment,
          child: Padding(
            padding: MediaQuery.of(context).padding.add(widget.padding),
            child: StreamBuilder<CustomDioLoadingModel>(
              stream: CustomDioLoading.state$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  return Material(
                    child: Container(
                      width: double.infinity,
                      color: customDioLoadingStateColor[snapshot.data?.state],
                      child: Text(
                        "Last data update: ${formatDate(snapshot.data.dateTime)}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .overline
                            .copyWith(
                              backgroundColor: customDioLoadingStateColor[
                                  snapshot.data?.state],
                            ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDioLoadingModel {
  final CustomDioLoadingState state;
  final DateTime dateTime;

  CustomDioLoadingModel({this.state, this.dateTime});

  CustomDioLoadingModel copyWith({
    CustomDioLoadingState state,
    DateTime dateTime,
  }) {
    return CustomDioLoadingModel(
      dateTime: dateTime ?? this.dateTime,
      state: state ?? this.state,
    );
  }
}

enum CustomDioLoadingState {
  none,
  old,
  updated,
}

var customDioLoadingStateColor = {
  CustomDioLoadingState.none: Colors.transparent,
  CustomDioLoadingState.old: Colors.purple,
  CustomDioLoadingState.updated: Colors.green,
};
