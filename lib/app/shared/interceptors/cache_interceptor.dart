import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    return options;
  }

  @override
  onResponse(Response response) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var data =
          response.data is String ? response.data : jsonEncode(response.data);
      await prefs.setString(response.request.path, data);
        prefs.setString(response.request.path, data);
      return response;
    } catch (ex) {
      return response;
    }
  }

  @override
  onError(DioError e) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(e.request.path)) {
        var data = jsonDecode(prefs.getString(e.request.path));
        return Dio().resolve(Response(data: data));
      } else {
        return e;
      }
    } catch (err) {
      return err;
    }
  }
}
