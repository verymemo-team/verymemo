import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:verymemo/externals/storage/storage_service.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  final StorageService storage;
  late String message;

  DioInterceptor(this.dio, this.storage);

  @override
  String toString() => message;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('${options.uri} 요청중...', name: options.method);
    return handler.next(options);
  }
}
