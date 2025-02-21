import 'package:dio/dio.dart';
import 'package:verymemo/common/types/typedef.dart';

abstract class DioService {
  String get baseUrl;
  MAP get headers;
  BaseOptions get baseOptions;
}
