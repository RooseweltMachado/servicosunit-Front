import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
    _dio._dio.interceptor
        .add(InterceptorsWrapper(onResponse: _onResponse, onError: _onError));
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptor.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  _onError(DioError e, ErrorInterceptorHandler handler) {
    return e;
  }

  _onResponse(Response e, ResponseInterceptorHandler handler) {
    print("############################# Log");
    print(e.data);
    print("############################# Log");
    return e;
  }
}
