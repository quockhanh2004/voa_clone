import 'package:dio/dio.dart';
import 'package:voa_clone/app/constants/value.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();
  static Dio? _dio;

  factory ApiClient() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = BaseUrl.baseUrl;
      _dio!.options.contentType = Headers.jsonContentType;
    _dio!.options.connectTimeout = const Duration(seconds: 30);
      _dio!.options.receiveTimeout = const Duration(seconds: 30);
      _dio!.options.validateStatus = (status) {
        return status! < 500 && status != 400;
      };
    }
    return _singleton;
  }

  void updateDioAuthToken(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  ApiClient._internal();

  Dio get dio => _dio!;
}
