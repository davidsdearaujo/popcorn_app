import 'package:dio/dio.dart';

class PrintLogInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    print("${DateTime.now()} - [${options.method}] ${options.uri}");
    return options;
  }

  @override
  onResponse(Response response) async {
    print("${DateTime.now()} - [${response.request.method} ${response.statusCode}] ${response.request.uri}");
    if (response.statusCode != 200) print(response.data);

    return response;
  }

  @override
  onError(DioError e) async {
    print("${DateTime.now()} - [DIO_ERROR] ${e.message}");
    return e;
  }
}
