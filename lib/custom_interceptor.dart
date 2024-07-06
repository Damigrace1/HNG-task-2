import 'dart:developer';

import 'package:dio/dio.dart';


class CustomInterceptor extends Interceptor {


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Endpoint >> ${err.response!.requestOptions.path}');
    log('Code >> ${err.response!.statusCode}');
    log('Error >> ${err.response!.data}');

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Endpoint >> ${response.requestOptions.path}');
    log('Code >> ${response.statusCode}');
    //log('Response >> ${response.data}');

    super.onResponse(response, handler);
  }
}