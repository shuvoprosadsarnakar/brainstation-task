import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = "https://api.github.com/search/repositories?q=";
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      responseHeader: false,
      requestBody: true,
      responseBody: false,
      error: true,
      compact: true,
    ));
  }

  Dio get client => _dio;
}
